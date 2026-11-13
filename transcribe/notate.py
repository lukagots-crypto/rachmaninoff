"""Turn quantized notes (Fraction beat positions) into a two-staff LilyPond score."""
from fractions import Fraction as F
from collections import defaultdict
import numpy as np

# Spelling for C-sharp minor (sharps only; C -> B#, F -> E#)
SPELL = {0: ('bis', -1), 1: ('cis', 0), 2: ('d', 0), 3: ('dis', 0), 4: ('e', 0),
         5: ('eis', 0), 6: ('fis', 0), 7: ('g', 0), 8: ('gis', 0), 9: ('a', 0),
         10: ('ais', 0), 11: ('b', 0)}


def ly_pitch(p):
    name, adj = SPELL[p % 12]
    octv = p // 12 - 1 + adj          # scientific octave of the spelled note
    marks = octv - 3
    return name + ("'" * marks if marks > 0 else "," * (-marks))


def split_hands(qnotes, max_per_hand=5, max_span=14):
    """Assign each note to 'L' or 'R'. Notes are grouped by start position."""
    by_start = defaultdict(list)
    for n in qnotes:
        by_start[n[0]].append(n)
    last = {'L': 50.0, 'R': 70.0}
    centre = {'L': 48.0, 'R': 70.0}
    out = {'L': [], 'R': []}
    for s in sorted(by_start):
        ns = sorted(by_start[s], key=lambda n: n[2])
        ps = [n[2] for n in ns]
        best = None
        for k in range(len(ps) + 1):
            Lp, Rp = ps[:k], ps[k:]
            c = 0.0
            for hand, grp in (('L', Lp), ('R', Rp)):
                if not grp:
                    continue
                span = grp[-1] - grp[0]
                c += 30.0 * max(0, span - max_span) + 3.0 * max(0, len(grp) - max_per_hand)
                for p in grp:
                    c += 0.12 * abs(p - last[hand]) + 0.06 * abs(p - centre[hand])
            for p in Lp:
                c += 4.0 * max(0, p - 67)       # LH rarely above G4
            for p in Rp:
                c += 4.0 * max(0, 53 - p)       # RH rarely below F3
            if best is None or c < best[0]:
                best = (c, k)
        k = best[1]
        for hand, grp in (('L', ns[:k]), ('R', ns[k:])):
            if not grp:
                continue
            # keep loudest notes if too many
            if len(grp) > max_per_hand:
                grp = sorted(sorted(grp, key=lambda n: -n[3])[:max_per_hand], key=lambda n: n[2])
            out[hand].extend(grp)
            mean = float(np.mean([n[2] for n in grp]))
            last[hand] = mean
            centre[hand] = 0.9 * centre[hand] + 0.1 * mean
    return out


def voice_segments(notes, total):
    """Single voice: list of (start, end, pitches or None for rest) covering [0,total)."""
    by_start = defaultdict(list)
    for n in notes:
        by_start[n[0]].append(n)
    starts = sorted(by_start)
    segs, t = [], F(0)
    for i, s in enumerate(starts):
        if s > t:
            segs.append((t, s, None))
        nxt = starts[i + 1] if i + 1 < len(starts) else total
        end = min(nxt, max(n[1] for n in by_start[s]))
        # avoid tiny rests: extend to next onset if gap is under a beat
        if nxt - end < 1 and nxt > end:
            end = nxt
        # readability: avoid ties across beats. Off-beat notes stop at the next
        # beat; on-beat notes keep whole beats only (when at least one beat long).
        if s.denominator != 1:
            end = min(end, F(int(s) + 1))
        elif end - s >= 1:
            end = s + int(end - s)
        pitches = sorted(set(n[2] for n in by_start[s]))
        segs.append((s, end, pitches))
        t = end
    if t < total:
        segs.append((t, total, None))
    return segs


DUR_DUPLE = {F(1, 4): '16', F(1, 2): '8', F(3, 4): '8.', F(1): '4'}
DUR_TRIP = {F(1, 3): '8', F(2, 3): '4'}
WHOLE_BEATS = {1: '4', 2: '2', 3: '2.', 4: '1'}


def bar_clefs(segs, nbars, default, beats_per_bar=4):
    """Pick treble/bass per bar from the mean pitch of the notes in it (with hysteresis)."""
    sums = defaultdict(list)
    for s, e, ps in segs:
        if ps:
            sums[int(s) // beats_per_bar].extend(ps)
    clefs, cur = [], default
    for b in range(nbars):
        if sums[b]:
            m = float(np.mean(sums[b]))
            if cur == 'bass' and m > 62:
                cur = 'treble'
            elif cur == 'treble' and m < 55:
                cur = 'bass'
        clefs.append(cur)
    return clefs


def render_voice(segs, subdiv, beats_per_bar=4, default_clef='treble'):
    """Return LilyPond music string, one bar per line."""
    nbeats = len(subdiv)
    # pieces per beat: (beat, start_frac, length, seg_id, pitches)
    pieces = []
    for sid, (s, e, ps) in enumerate(segs):
        t = s
        while t < e:
            b = int(t)
            if b >= nbeats:
                break
            nb = min(e, F(b + 1))
            pieces.append([b, t - b, nb - t, sid, ps])
            t = nb
    # merge whole-beat pieces of the same segment into longer notes within a bar
    out_bars = []
    i = 0
    bar_tokens, cur_bar = [], 0
    def emit(tok):
        bar_tokens.append(tok)
    tokens_by_bar = defaultdict(list)
    while i < len(pieces):
        b, st, ln, sid, ps = pieces[i]
        bar = b // beats_per_bar
        pos = b % beats_per_bar
        if st == 0 and ln == 1:
            # gather following whole beats of same seg in same bar
            j = i
            while (j + 1 < len(pieces) and pieces[j + 1][3] == sid and pieces[j + 1][1] == 0
                   and pieces[j + 1][2] == 1 and pieces[j + 1][0] // beats_per_bar == bar):
                j += 1
            n = j - i + 1
            # legal lengths by position: avoid crossing the bar's middle off-beat
            allowed = {0: [4, 3, 2, 1], 1: [3, 1], 2: [2, 1], 3: [1]}[pos]
            if beats_per_bar != 4:
                allowed = [k for k in range(beats_per_bar - pos, 0, -1)]
            m = next(k for k in allowed if k <= n)
            more = (i + m < len(pieces) and pieces[i + m][3] == sid)
            tokens_by_bar[bar].append(('note', ps, WHOLE_BEATS[m], more, None))
            i += m
            continue
        # partial beat: collect all pieces in this beat
        j = i
        group = []
        while j < len(pieces) and pieces[j][0] == b:
            group.append(pieces[j])
            j += 1
        d = subdiv[b]
        trip = (d == 3)
        toks = []
        for g in group:
            _, gst, gln, gsid, gps = g
            nxt_same = False
            idx = pieces.index(g)
            if idx + 1 < len(pieces) and pieces[idx + 1][3] == gsid:
                nxt_same = True
            table = DUR_TRIP if trip else DUR_DUPLE
            if gln in table:
                toks.append(('note', gps, table[gln], nxt_same, None))
            else:
                # split into representable units
                unit = F(1, 3) if trip else F(1, 4)
                left = gln
                parts = []
                while left > 0:
                    for cand in sorted(table, reverse=True):
                        if cand <= left:
                            parts.append(cand); left -= cand; break
                    else:
                        parts.append(unit); left -= unit
                for pi_, part in enumerate(parts):
                    tie = nxt_same if pi_ == len(parts) - 1 else True
                    toks.append(('note', gps, table.get(part, '16'), tie, None))
        tokens_by_bar[bar].append(('tuplet' if trip else 'group', toks))
        i = j
    lines = []
    clefs = bar_clefs(segs, max(tokens_by_bar) + 1, default_clef, beats_per_bar)
    prev = default_clef
    for bar in sorted(tokens_by_bar):
        parts = []
        if clefs[bar] != prev:
            parts.append('\\clef ' + clefs[bar])
            prev = clefs[bar]
        for tk in tokens_by_bar[bar]:
            if tk[0] == 'note':
                parts.append(fmt(tk))
            else:
                inner = ' '.join(fmt(x) for x in tk[1])
                parts.append('\\tuplet 3/2 { ' + inner + ' }' if tk[0] == 'tuplet' else inner)
        lines.append(' '.join(parts) + ' |')
    return lines


def fmt(tk):
    _, ps, dur, tie, _ = tk
    if ps is None:
        return 'r' + dur
    if len(ps) == 1:
        s = ly_pitch(ps[0]) + dur
    else:
        s = '<' + ' '.join(ly_pitch(p) for p in ps) + '>' + dur
    return s + ('~' if tie else '')

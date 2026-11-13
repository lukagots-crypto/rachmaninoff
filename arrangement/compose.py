"""Original 'Prelude in C minor' in the style of Rachmaninoff's Op. 3 No. 2.
Generates prelude.ly (LilyPond). Pitches are MIDI numbers (60 = middle C)."""

NAMES = ['c', 'des', 'd', 'ees', 'e', 'f', 'ges', 'g', 'aes', 'a', 'bes', 'b']
DUR = {4: '1', 3: '2.', 2: '2', 1: '4', 0.5: '8'}


def lyp(m):
    marks = m // 12 - 4
    return NAMES[m % 12] + ("'" * marks if marks > 0 else "," * -marks)


def ev(ps, d, post=''):
    """one note/chord/rest token"""
    if not ps:
        return 'r' + DUR[d] + post
    if len(ps) == 1:
        return lyp(ps[0]) + DUR[d] + post
    return '<' + ' '.join(lyp(p) for p in sorted(ps)) + '>' + DUR[d] + post


# ---------------------------------------------------------------- sections
# each bar: (rh_events, lh_events); event = (pitches, quarters[, post])
motto = [
    ([([72, 79, 84], 1, '\\fff'), ([68, 75, 80], 1), ([67, 74, 79], 2)],
     [([36, 43, 48], 1, '\\fff'), ([32, 39, 44], 1), ([31, 38, 43], 2)]),
    ([([], 4)], [([24, 36], 4, '\\fermata')]),
]

theme = [  # Lento theme: melody on top of RH chords, LH bass + pulsing chords
    ([([60, 63, 67], 3, '\\pp'), ([60, 65, 68], 1)],
     [([36], 1, '\\pp'), ([43, 48, 51], 1), ([43, 48, 51], 1), ([44, 48, 53], 1)]),
    ([([63, 67], 1), ([62, 65], 1), ([60, 63], 2)],
     [([39], 1), ([46, 50, 53], 1), ([44], 1), ([44, 48, 51], 1)]),
    ([([59, 62], 1), ([60, 63], 1), ([56, 62, 65], 1), ([53, 58], 1)],
     [([31, 43], 1), ([36, 43], 1), ([34, 41], 1), ([34, 44], 1)]),
    ([([55, 58, 63], 4)],
     [([27, 39], 2), ([34, 43], 2)]),
    ([([60, 63, 67], 3, '\\p'), ([63, 68, 72], 1)],
     [([36, 48], 1), ([43, 48, 51], 1), ([43, 48, 51], 1), ([44, 48, 51], 1)]),
    ([([61, 65, 70], 1), ([60, 65, 68], 1), ([59, 62, 67], 2)],
     [([41], 1), ([44, 48, 53], 1), ([31, 43], 1), ([43, 47, 50], 1)]),
    ([([56, 62, 65], 1, '\\<'), ([60, 63, 67], 1), ([60, 65, 68], 1), ([62, 65, 71], 1)],
     [([32, 44], 1), ([43], 1), ([41], 1), ([31, 43], 1)]),
    ([([60, 63, 67, 72], 4, '\\mf')],
     [([24, 36], 4)]),
]

transition = [
    ([([60, 63, 67], 2, '\\pp'), ([60, 63, 68], 2)],
     [([36, 48], 1), ([32, 44], 1), ([31, 43], 2)]),
    ([([59, 62, 65, 67], 4, '\\fermata')],
     [([31, 43], 4, '\\fermata')]),
]

# Agitato: (chord pitch classes, 4 melody notes, 4 bass notes)
agitato_plan = [
    ({0, 3, 7}, [67, 68, 67, 63], [36, 43, 39, 43]),
    ({5, 8, 0}, [68, 72, 70, 68], [41, 48, 44, 48]),
    ({10, 2, 5, 8}, [70, 74, 72, 70], [46, 41, 38, 41]),
    ({3, 7, 10}, [67, 70, 75, 74], [39, 46, 43, 46]),
    ({8, 0, 3}, [72, 75, 77, 75], [44, 51, 48, 51]),
    ({2, 5, 8, 0}, [74, 77, 75, 74], [38, 44, 41, 44]),
    ({7, 11, 2, 5}, [71, 74, 79, 77], [43, 50, 47, 50]),
    ({0, 3, 7}, [75, 79, 84, 79], [36, 43, 39, 43]),
    ({5, 8, 0}, [80, 79, 77, 75], [44, 48, 41, 48]),
    ({1, 5, 8}, [77, 73, 72, 73], [37, 44, 41, 44]),
    ({7, 11, 2, 5}, [74, 71, 67, 71], [43, 50, 47, 50]),
    ({7, 11, 2, 5}, [74, 77, 79, 83], [31, 38, 43, 47]),
]
AG_DYN = {0: ('\\mp', ''), 6: ('\\<', ''), 8: ('\\f', ''), 10: ('\\<', '')}


def below(mel, pcs, n=2, gap=3):
    """n chord tones under mel, each at least `gap` semitones from the previous one."""
    out, last, p = [], mel, mel - 1
    while len(out) < n:
        if p % 12 in pcs and last - p >= gap:
            out.append(p); last = p
        p -= 1
    return out


def agitato_bar(i, pcs, mel, bass):
    rh, lh = [], []
    for b in range(4):
        t = below(mel[b], pcs, 4)
        c1, c2, c3 = [mel[b], t[0], t[1]], [t[1], t[2], t[3]], [t[0], t[1], t[2]]
        mark = AG_DYN.get(i, ('', ''))[0] if b == 0 else ''
        rh.append('\\tuplet 3/2 { %s %s %s }' % (ev(c1, 0.5, mark), ev(c2, 0.5), ev(c3, 0.5)))
        lo = bass[b] - 12 if bass[b] - 12 >= 24 else bass[b]
        lh.append(ev(fill_lh([lo, bass[b]] if lo != bass[b] else [lo], pcs, min(c2)), 1,
                     mark if b == 0 and i == 0 else ''))
    return ' '.join(rh), ' '.join(lh)


def _spread_pick(cands, have):
    return max(cands, key=lambda c: min(abs(c - h) for h in have))


def _ok(cands, have):
    return [c for c in cands if min(abs(c - h) for h in have) >= 3]


def fill_rh(ps, pcs, floor):
    ps = sorted(set(ps))
    if not ps or len(ps) >= 3:
        return ps
    top = ps[-1]
    if top - 12 not in ps and top - 12 > floor and ps[0] >= top - 12:
        ps.append(top - 12)
    while len(ps) < 3:
        lo = min(ps)
        cands = _ok([c for c in range(lo + 1, top) if c % 12 in pcs], ps)
        if not cands:
            cands = _ok([c for c in range(top - 12, top) if c % 12 in pcs and c > floor], ps)
        if not cands:
            cands = _ok([c for c in range(top - 15, top) if c % 12 in pcs and c > floor], ps)
        if not cands:
            break
        ps.append(_spread_pick(cands, ps))
    return sorted(ps)


def fill_lh(ps, pcs, ceiling):
    ps = sorted(set(ps))
    if not ps or len(ps) >= 3:
        return ps
    bot = ps[0]
    if bot + 12 not in ps and bot + 12 < ceiling and ps[-1] <= bot + 12:
        ps.append(bot + 12)
    elif bot - 12 >= 24 and bot - 12 not in ps and len(ps) == 1:
        ps.insert(0, bot - 12)
    while len(ps) < 3:
        lo, hi = min(ps), max(ps)
        cands = _ok([c for c in range(lo + 1, hi) if c % 12 in pcs and c < ceiling], ps)
        if not cands:
            cands = _ok([c for c in range(hi + 1, min(ceiling, lo + 16)) if c % 12 in pcs], ps)
        if not cands:
            break
        ps.append(_spread_pick(cands, ps))
    return sorted(ps)


def thicken(bar):
    """Give every chord at least 3 notes per hand, using the harmony sounding at that moment."""
    rh, lh = bar
    def spans(evs):
        t, out = 0, []
        for e in evs:
            out.append((t, t + e[1], e)); t += e[1]
        return out
    R_, L_ = spans(rh), spans(lh)
    def at(t, sp):
        return [p for a, b, e in sp if a <= t < b for p in e[0]]
    def harmony(t):
        pcs = {p % 12 for p in at(t, R_) + at(t, L_)}
        if len(pcs) == 1:
            pcs |= {(next(iter(pcs)) + 7) % 12}
        return pcs
    nrh = []
    for a, b, e in R_:
        lhn = at(a, L_)
        nrh.append((fill_rh(e[0], harmony(a), max(lhn) if lhn else 0), e[1]) + tuple(e[2:]))
    R2 = spans(nrh)
    nlh = []
    for a, b, e in L_:
        rhn = at(a, R2)
        nlh.append((fill_lh(e[0], harmony(a), min(rhn) if rhn else 72), e[1]) + tuple(e[2:]))
    return nrh, nlh


def climax(bar):
    """Theme reprise: RH up an octave with melody doubled, LH in octaves."""
    rh, lh = bar
    nrh = []
    for e in rh:
        ps = [p + 12 for p in e[0]]
        top = max(ps)
        ps = sorted(set([p for p in ps if p >= top - 12] + [top - 12]))
        nrh.append((ps, e[1]) + tuple(x.replace('\\pp', '').replace('\\p', '').replace('\\mf', '')
                                       .replace('\\<', '') for x in e[2:]))
    nlh = []
    for e in lh:
        ps = e[0]
        if len(ps) == 1 and ps[0] - 12 >= 24:
            ps = [ps[0] - 12, ps[0]]
        nlh.append((ps, e[1]))
    return nrh, nlh


coda = [
    ([([60, 72], 1, '\\pp'), ([56, 68], 1), ([55, 67], 2)],
     [([24, 36], 4, '\\pp')]),
    ([([55, 59, 62, 65], 2), ([55, 60, 63], 2)],
     [([31, 43], 2), ([36, 48], 2)]),
    ([([60, 65, 68, 72], 4)],
     [([24, 36], 4)]),
    ([([55, 60, 63, 67], 4, '\\fermata\\ppp')],
     [([24, 36, 43], 4, '\\fermata')]),
]


def bars_to_ly(bars):
    rh, lh = [], []
    for r, l in bars:
        rh.append(' '.join(ev(*e) for e in r) + ' |')
        lh.append(' '.join(ev(*e) for e in l) + ' |')
    return rh, lh


R, L = [], []
def add(section, rh_head='', lh_head=''):
    r, l = bars_to_ly([thicken(b) for b in section])
    if rh_head:
        r[0] = rh_head + ' ' + r[0]
    if lh_head:
        l[0] = lh_head + ' ' + l[0]
    R.extend(r); L.extend(l)

add(motto, '\\tempo "Lento" 4 = 52')
add(theme)
add(transition)
ag_r, ag_l = zip(*[agitato_bar(i, *x) for i, x in enumerate(agitato_plan)])
ag_r = [x + ' |' for x in ag_r]; ag_l = [x + ' |' for x in ag_l]
ag_r[0] = '\\tempo "Agitato" 4 = 100 ' + ag_r[0]
R.extend(ag_r); L.extend(ag_l)
clim = [climax(b) for b in theme]
clim[0][0][0] = (clim[0][0][0][0], clim[0][0][0][1], '\\fff')
clim[0][1][0] = (clim[0][1][0][0], clim[0][1][0][1], '\\fff')
clim[-1][0][0] = (clim[-1][0][0][0], clim[-1][0][0][1], '\\ff')
add(clim, '\\tempo "Maestoso" 4 = 58')
add(coda, '\\tempo "Lento, morendo" 4 = 48')

PED = '\\set Staff.pedalSustainStyle = #\'bracket'
# pedal change every bar in the left hand
L = [l.replace(' |', '', 1) if False else l for l in L]
L_ped = []
for i, l in enumerate(L):
    toks = l.split(' ', 1)
    if toks[0].startswith('\\tuplet'):
        L_ped.append(l)
        continue
    # attach pedal to first token (skip leading commands)
    head, rest = toks[0], toks[1] if len(toks) > 1 else ''
    head += '\\sustainOn' if i == 0 else '\\sustainOff\\sustainOn'
    L_ped.append((head + ' ' + rest).strip())
L_ped[-1] = L_ped[-1].replace(' |', '\\sustainOff |')

ind = lambda xs: '\n'.join('    ' + x for x in xs)
ly = r'''\version "2.24.0"
\header {
  title = "Prelude in C minor"
  subtitle = "in the style of Rachmaninoff"
  composer = "Original composition"
  tagline = ##f
}
\paper {
  #(set-paper-size "letter")
  top-margin = 12\mm bottom-margin = 12\mm left-margin = 15\mm right-margin = 15\mm
  system-system-spacing.basic-distance = #16
  ragged-last-bottom = ##t
}
global = { \key c \minor \time 4/4 }
right = { \global \clef treble
%s
  \bar "|." }
left = { \global \clef bass %s
%s
  \bar "|." }
\score {
  \new PianoStaff \with { instrumentName = "Piano" } <<
    \new Staff = "up" \right
    \new Staff = "down" \left
  >>
  \layout { #(layout-set-staff-size 19) }
}
\score {
  \new PianoStaff << \new Staff \right \new Staff \left >>
  \midi { }
}
''' % (ind(R), '<>_\\markup { \\italic "con Ped." }', ind(L))
open('prelude.ly', 'w').write(ly)
print(len(R), 'bars')

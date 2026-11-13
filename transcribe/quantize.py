"""Rhythm quantization for a rubato piano performance.

Takes note events (from Basic Pitch) and finds a beat sequence with a smoothly
varying tempo by dynamic programming. Each beat also gets a subdivision
(1, 2, 3 or 4) that minimises onset-to-grid error. Returns notes placed on a
musical timeline measured in beats (Fractions).
"""
import csv
from fractions import Fraction
import numpy as np

RES = 0.01                      # seconds per DP grid step
LAG_MIN, LAG_MAX = 0.32, 1.30   # allowed beat length (s)
SIGMA = 0.045                   # onset timing tolerance (s)
SUBDIV_PEN = {1: 0.0, 2: 0.25, 3: 0.9, 4: 0.6}
BEAT_COST = 0.6                 # constant cost per beat (discourages tiny beats)
TEMPO_CHANGE = 25.0             # weight on log tempo change between beats
TEMPO_PRIOR, PRIOR_LAG = 0.8, 0.6


def load_notes(path, t0, t1, vmin=42):
    out = []
    for r in list(csv.reader(open(path)))[1:]:
        s, e, p, v = float(r[0]), float(r[1]), int(r[2]), int(r[3])
        if not (t0 <= s < t1):
            continue
        if v < 34 or (v < vmin and e - s < 0.2):
            continue
        out.append((s, e, p, v))
    return sorted(out)


def onset_groups(notes, win=0.035):
    groups = []
    for s, e, p, v in notes:
        w = v / 60.0 * (1.6 if p < 50 else 1.0)
        if groups and s - groups[-1][0] < win:
            g = groups[-1]
            g[1] += w
        else:
            groups.append([s, w])
    return np.array(groups)


def interval_cost(x, w, lag):
    """x: onset offsets from beat start (s), w: weights. Returns (cost, subdiv)."""
    best, bd = None, 1
    phi = x / lag
    for d, pen in SUBDIV_PEN.items():
        err = np.abs(phi * d - np.round(phi * d)) / d * lag
        c = float(np.sum(w * np.minimum(1.0, (err / SIGMA) ** 2))) + (pen if len(x) else 0)
        if best is None or c < best:
            best, bd = c, d
    return best, bd


def track_beats(groups, t_start, t_end):
    times, weights = groups[:, 0], groups[:, 1]
    N = int(round((t_end - t_start) / RES)) + 1
    lags = np.arange(int(LAG_MIN / RES), int(LAG_MAX / RES) + 1)
    L = len(lags)
    # interval cost C[j, li]: beat starting at grid j with length lags[li]
    C = np.zeros((N, L))
    for j in range(N):
        t = t_start + j * RES
        lo = np.searchsorted(times, t - 1e-9)
        hi = np.searchsorted(times, t + LAG_MAX)
        x, w = times[lo:hi] - t, weights[lo:hi]
        for li, lg in enumerate(lags):
            m = x < lg * RES - 1e-9
            C[j, li] = interval_cost(x[m], w[m], lg * RES)[0]
    lag_s = lags * RES
    prior = TEMPO_PRIOR * np.log(lag_s / PRIOR_LAG) ** 2
    trans = TEMPO_CHANGE * np.log(lag_s[None, :] / lag_s[:, None]) ** 2   # [l1, l2]
    INF = 1e18
    D = np.full((N + lags[-1] + 1, L), INF)
    back = np.full((N + lags[-1] + 1, L), -1, dtype=np.int32)
    # first beat starts at j=0 with any lag
    for li, lg in enumerate(lags):
        D[lg, li] = C[0, li] + BEAT_COST + prior[li]
    for j in range(1, N):
        cur = D[j]
        if not np.isfinite(cur).any() or cur.min() >= INF:
            continue
        # tot[l1, l2]
        tot = cur[:, None] + trans
        l1 = np.argmin(tot, axis=0)
        val = tot[l1, np.arange(L)] + C[j] + BEAT_COST + prior
        tgt = j + lags
        better = val < D[tgt, np.arange(L)]
        D[tgt[better], np.arange(L)[better]] = val[better]
        back[tgt[better], np.arange(L)[better]] = l1[better]
    # end: any state at j >= N-1
    sub = D[N - 1:]
    jj, li = np.unravel_index(np.argmin(sub), sub.shape)
    j = jj + N - 1
    beats = [j]
    while True:
        prev_l = back[j, li]
        jprev = j - lags[li]
        beats.append(jprev)
        if prev_l < 0:
            break
        j, li = jprev, prev_l
    beats = np.array(beats[::-1]) * RES + t_start
    subdiv = []
    for a, b in zip(beats[:-1], beats[1:]):
        m = (times >= a - 1e-9) & (times < b - 1e-9)
        subdiv.append(interval_cost(times[m] - a, weights[m], b - a)[1])
    return beats, subdiv


def to_beats(t, beats):
    """Continuous beat position of time t (linear extrapolation outside)."""
    ib = np.diff(beats)
    if t <= beats[0]:
        return (t - beats[0]) / ib[0]
    if t >= beats[-1]:
        return len(beats) - 1 + (t - beats[-1]) / ib[-1]
    k = np.searchsorted(beats, t) - 1
    return k + (t - beats[k]) / ib[k]


def snap(pos, subdiv):
    k = int(np.floor(pos))
    k = max(0, min(k, len(subdiv) - 1))
    d = subdiv[k]
    frac = pos - k
    q = Fraction(int(round(frac * d)), d)
    return k + q


def quantize(notes, beats, subdiv):
    """Return list of (start, end, pitch, vel) with start/end as Fraction beats."""
    out = {}
    for s, e, p, v in notes:
        qs = snap(to_beats(s, beats), subdiv)
        qe = snap(to_beats(e, beats), subdiv)
        k = int(qs)
        d = subdiv[min(k, len(subdiv) - 1)]
        if qe <= qs:
            qe = qs + Fraction(1, d)
        key = (qs, p)
        if key in out:
            out[key] = (qs, max(out[key][1], qe), p, max(out[key][3], v))
        else:
            out[key] = (qs, qe, p, v)
    return sorted(out.values())

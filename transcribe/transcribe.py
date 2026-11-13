"""Audio -> piano sheet music.

Usage:  python transcribe.py notes.csv out.ly [t_start t_end]
notes.csv comes from:  basic-pitch <outdir> audio.wav --save-note-events
"""
import sys
from fractions import Fraction as F
import numpy as np
from quantize import load_notes, onset_groups, track_beats, quantize
from notate import split_hands, voice_segments, render_voice

csv_path, ly_path = sys.argv[1], sys.argv[2]
t0 = float(sys.argv[3]) if len(sys.argv) > 3 else 0.0
t1 = float(sys.argv[4]) if len(sys.argv) > 4 else 1e9

notes = load_notes(csv_path, t0, t1)
groups = onset_groups(notes)
beats, subdiv = track_beats(groups, groups[0, 0], groups[-1, 0] + 0.05)
# extend beat list so note endings past the last beat have somewhere to go
ib = np.median(np.diff(beats[-8:]))
extra = 4
beats = np.concatenate([beats, beats[-1] + ib * np.arange(1, extra + 1)])
subdiv = list(subdiv) + [2] * extra
q = quantize(notes, beats, subdiv)
q = [n for n in q if n[0] < len(subdiv)]

# downbeat phase: put strong bass onsets on beat 1 (and 3)
score = np.zeros(4)
for s, e, p, v in q:
    if s.denominator == 1 and p < 55:
        score[int(s) % 4] += v * (1.0 if p < 45 else 0.6)
score2 = score + 0.5 * np.roll(score, -2)
phase = int(np.argmax(score2))
shift = (4 - phase) % 4
q = [(s + shift, e + shift, p, v) for s, e, p, v in q]
subdiv = [1] * shift + subdiv
total = int(max(n[0] for n in q)) + 1
total += (-total) % 4
subdiv = (subdiv + [1] * total)[:total]
q = [(s, min(e, F(total)), p, v) for s, e, p, v in q]

hands = split_hands(q)
rh = render_voice(voice_segments(hands['R'], F(total)), subdiv)
lh = render_voice(voice_segments(hands['L'], F(total)), subdiv, default_clef='bass')
bpm = int(round(60 / np.median(np.diff(beats)) / 4) * 4)

def block(lines):
    return '\n'.join('    ' + l for l in lines)

ly = rf'''\version "2.24.0"
\header {{
  title = "Piano Transcription"
  subtitle = "transcribed from audio recording"
  tagline = ##f
}}
\paper {{
  #(set-paper-size "letter")
  top-margin = 12\mm bottom-margin = 12\mm left-margin = 14\mm right-margin = 14\mm
  system-system-spacing.basic-distance = #14
  ragged-last-bottom = ##t
}}
global = {{ \key cis \minor \time 4/4 \tempo "Rubato" 4 = {bpm} }}
right = {{
  \global \clef treble
{block(rh)}
  \bar "|."
}}
left = {{
  \global \clef bass
{block(lh)}
  \bar "|."
}}
\score {{
  \new PianoStaff \with {{ instrumentName = "Piano" }} <<
    \new Staff = "up" \right
    \new Staff = "down" \left
  >>
  \layout {{
    #(layout-set-staff-size 18)
    \context {{ \Score \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }}
  }}
}}
\score {{
  \unfoldRepeats \new PianoStaff <<
    \new Staff = "up" \right
    \new Staff = "down" \left
  >>
  \midi {{ }}
}}
'''
open(ly_path, 'w').write(ly)
print(f"beats={len(beats)} bars={total // 4} bpm~{bpm} RH notes={len(hands['R'])} LH notes={len(hands['L'])}")

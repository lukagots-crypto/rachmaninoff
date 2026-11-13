\version "2.24.0"
\header {
  title = "Piano Transcription"
  subtitle = "transcribed from audio recording"
  tagline = ##f
}
\paper {
  #(set-paper-size "letter")
  top-margin = 12\mm bottom-margin = 12\mm left-margin = 14\mm right-margin = 14\mm
  system-system-spacing.basic-distance = #14
  ragged-last-bottom = ##t
}
global = { \key cis \minor \time 4/4 \tempo "Rubato" 4 = 144 }
right = {
  \global \clef treble
    r2 r16 a8. r4 |
    r2 r16 gis8. r4 |
    r1 |
    r1 |
    r2. r8 gis'8 |
    r4 r16 <cis' e' cis''>16 gis8 r8. <gis' e''>16 e'4 |
    <cis' dis''>16 e'8. r16 cis''16 gis8 e'16 gis'16 <e' e''>16 gis'16 r16 <cis' gis' cis''>8 cis'16 |
    r8 <cis' e' dis''>8 r8. <cis' cis''>16 r16 a'8. <e' a'>4 |
    r16 <a' b' b''>8. dis'8 gis'16 <cis' e'>16 r8. <cis' e'>16 r4 |
    r8 e'8 r4 r16 <gis gis'>8. cis'16 gis16 cis'16 <e' e''>16 |
    r4 dis'4 <cis' cis''>8 cis'16 e''16 e'8 <cis' e' cis''>8 |
    r8 dis''8 r4 r16 gis'16 gis16 r16 r8. g'16 |
    r8. <a dis' fis'>16 r4 <a dis'>16 a'8 <a' fis''>16 fis'8 a8 |
    \tuplet 3/2 { dis'''8 fis'''4 } \tuplet 3/2 { e'8 cis'8 e'8 } r8 <b b'>8 r8 <a e' a'>8 |
    r16 gis'8. b'8. gis'16 r8. a'16 \tuplet 3/2 { r4 gis'8 } |
    r8 dis'16 b16 r8 e'8 r8 cis'8 a8 e'8 |
    r8 <cis' e'>8 r16 e'8 cis'16 cis'8. <e' e''>16 cis'8 <a a' a''>16 e'16 |
    a''16 <cis'' cis'''>8. r16 <b' b''>8. <a' a''>8 <e cis' e' a'>8 <a' cis''>16 cis'16 cis'16 a''16 |
    a'16 b'16 fis''16 b''16 \tuplet 3/2 { r8 <a' a''>8 a'8 } <fis' fis''>4 <a' a''>8. <a a'>16 |
    e'4 r16 e'8. <a cis' e'>8 <a cis'>8 r16 a16 e'8 |
    e'16 <a' a''>16 a''8 <cis'' cis'''>8. e''16 <a a'>16 <e'' e'''>8 <cis'' cis'''>16 r8 a''16 a'16 |
    cis'16 <b' b''>8. cis''8. a''16 a'8 <a cis' eis' eis''>8 <a eis'>16 cis'8 <a' a''>16 |
    r16 <d' fis'>8. r8 <d' a'>8 \tuplet 3/2 { <d' d''>8 <d' a'>8 <d' fis' a' d''>8 } r16 <fis' fis''>8 <a' a''>16 |
    \tuplet 3/2 { r8 d''4 } r16 <a'' a'''>8. \tuplet 3/2 { r8 <a' d''>4 } a'8 <gis' gis''>8 |
    gis''16 <d' gis'>8 <b' b''>16 \tuplet 3/2 { r8 d''4 } \tuplet 3/2 { r8 <cis' gis'' b''>4 } r4 |
    r8 gis'8 r16 <fis'' a''>8. fis''8. <a' a''>16 r16 a16 cis''8 |
    r8 fis''8 r8 e'''8 r8. cis''16 r8 d''8 |
    r16 cis''8. r16 b''8 <a' a''>16 r16 gis''8. <dis' gis'>8 bis8 |
    <dis cis'>8 fis16 bis16 r16 <bis gis'>16 <fis eis'>16 bis16 r8 <gis' gis''>8 gis'8 cis''16 gis'16 |
    r8 eis''8 r4 gis''4 r8 cis'8 |
    \tuplet 3/2 { <cis'' dis''>4 eis''8 } \tuplet 3/2 { eis'8 <fis' ais' fis''>8 ais'8 } r2 |
    r16 <cis' eis'>8. gis''16 gis'8 <cis'' cis'''>16 r8 <eis'' eis'''>8 r8 ais''8 |
    r16 gis'''8 gis''16 <cis'' cis'''>8 cis''8 dis''4 r16 <eis'' bis''>8. |
    r16 <a bis eis'>8 a16 <bis a'>8 <a a'>16 eis''16 r4 r16 a'8 eis''16 |
    a'8 cis''8 r16 cis'8. ais'16 ais''8 cis''16 r8 eis''8 |
    r16 ais''8. gis''8. cis''16 r2 |
    gis'''16 gis''8. \tuplet 3/2 { dis'8 <fis'' ais''>4 } r16 <ais dis'>8 <ais bis dis'>16 r8 bis16 gis'16 |
    r4 dis''4 <fis'' fis'''>4 <cis''' eis'''>16 eis''8 cis'16 |
    <gis cis' gis'>4 gis'8. cis'16 r16 cis'16 gis''16 gis'16 r16 cis''8. |
    r16 ais''8. dis''8. ais'''16 \tuplet 3/2 { ais''8 dis''4 } eis''8 dis''8 |
    ais''16 ais'16 <ais' cis''>8 gis''16 <bis' gis''>8 bis'16 r8 gis''8 r4 |
    r16 eis''8 fis''16 fis''8 gis''8 r16 dis'8 <dis' gis' dis''>16 r8 gis'8 |
    d''8. <d' e''>16 r16 <gis d' ais'>16 ais''16 <d'' d'''>16 r16 eis''8. <fis'' ais''>8. r16 |
    r2 r8 a'8 r8 fis'8 |
    r8 <a cis'>8 r8 <gis eis'>16 <gis' gis''>16 r16 cis'16 cis16 <cis' cis''>16 r16 cis'16 ais'''16 <ais' ais''>16 |
    r16 <gis' ais' gis''>8. \tuplet 3/2 { <eis'' eis'''>4 cis''8 } \tuplet 3/2 { r8 dis''4 } eis'''8 cis''8 |
    gis''16 gis'16 bis''8 <cis'' cis'''>8 gis''16 gis'16 eis'16 fis'8 gis'16 r8 cis''16 r16 |
    r2 cis''8 <cis' gis'>8 r4 |
    r16 cis'8. r8 cis'8 r16 dis'8 dis'16 r8 fis8 |
    <dis fis>8 fis8 <fis dis' fis'>8. dis'16 r16 <ais dis' ais'>8 fis'16 <ais' dis''>8. <gis bis dis'>16 |
    r4 <bis dis'>8 <fis dis'>8 <gis bis>8 dis'8 r16 fis16 dis'16 fis16 |
    gis16 <fis bis dis'>16 gis16 <fis dis' gis'>16 \tuplet 3/2 { r8 <dis' dis''>4 } r16 <cis' eis' cis''>16 gis'16 cis'16 r4 |
    <ais' ais''>8 ais''8 ais'8 gis''16 cis''''16 r8. cis'''16 cis''8 ais'8 |
    r16 gis''16 gis'8 r4 \tuplet 3/2 { cis''8 ais'4 } r16 gis'16 r8 |
    r8. cis'16 r4 gis8 r8 r8. <gis' gis''>16 |
    r8 cis''8 r16 <gis' gis''>8. fis''16 fis''8 eis''16 r8 cis''8 |
    r8. eis'''16 r2. |
  \bar "|."
}
left = {
  \global \clef bass
    r2 a16 a,,16 a,8 r4 |
    r4 r8 a,8 r16 gis,16 gis,,8 r4 |
    r2 r8 <gis,, gis,>8 r4 |
    <cis, cis>2. r4 |
    cis,,4 cis,2. |
    r4 r8 e8 cis,8 e16 gis16 e4 |
    <e gis>16 gis16 e8 cis,8. e16 r16 gis8 e16 r16 gis8. |
    cis8 gis8 a4~ a4 a16 fis8. |
    r16 fis8 r16 r4 <e gis>16 cis16 r8 r8 cis8 |
    r4 \tuplet 3/2 { r8 a8 <a,, a,>8 } r4 gis,16 gis,,8 gis,16 |
    gis,,4 cis,2. |
    e16 cis,16 gis8 r16 cis'8. cis,8 <cis e>8 r4 |
    r8. dis,16 r4 <dis, dis>8. <dis a dis'>16 r8 dis,8 |
    \tuplet 3/2 { r8 fis'4 } \tuplet 3/2 { b,8 cis8 cis8 } e8 e8 b,8 cis8 |
    r16 gis8. b8. gis16 r16 gis,8 fis16 \tuplet 3/2 { a8 <gis, e>8 gis8 } |
    r8 dis16 gis,16 r8 e8 r8 <cis a>8 a,,16 a,16 a,8 |
    e8 a16 a,,16 e8. a16 r8 a16 e16 r8 a,,16 e16 |
    r16 <a,, a cis'>8 a16 r16 <e a cis'>16 a,,16 e16 a8 a,,8 a16 a,8 a16 |
    e16 fis16 d'8 \tuplet 3/2 { r8 <fis a>4 } <a d'>8 fis16 d'16 r8. a,,16 |
    r8 e8 r8 a,16 a,,16 <a, e>4 r8 e16 a16 |
    e16 a8. r8 cis,8 cis,16 <cis e>8. a16 a,16 a16 cis16 |
    e16 <a e'>8 e'16 cis'8 e'16 a16 e8 a,,8 e8. a16 |
    r16 d,16 d8 r8 a8 \tuplet 3/2 { a8 a8 a8 } d16 <a d'>8 <a d'>16 |
    \tuplet 3/2 { d8 d'4 } b,16 b,,8 fis16 \tuplet 3/2 { <a d'>8 d'8 a8 } r8 e,8 |
    r16 gis8 gis16 \tuplet 3/2 { d'8 d'4 } \tuplet 3/2 { <e, cis>8 <cis, cis>4 } <gis b>4 |
    eis'8 gis8 r16 fis16 fis,16 fis,,16 r8. <a fis'>16 fis,,8 a16 <cis cis'>16 |
    r8 <b,, b,>8 r16 <fis a>8. d'16 <fis a>16 d'16 fis16 a8. d'16 |
    r16 cis'16 a8 b16 b,8 a16 r16 gis,8 gis,16 gis,8 gis8 |
    gis,,8 r8 r4 r8 <dis fis>8 gis16 bis16 <fis gis bis>8 |
    r8 <dis gis bis>8 \tuplet 3/2 { fis4 cis,8 } cis'4 gis16 cis,16 gis8 |
    \tuplet 3/2 { r4 <cis gis>8 } \tuplet 3/2 { cis'8 <fis cis'>8 cis'8 } cis'16 eis8 <cis ais cis'>16 ais16 <cis ais cis' dis'>8 dis'16 |
    cis,4 gis16 eis'16 cis,16 cis'16 r8 <cis' eis'>8 r16 cis'8 <gis cis'>16 |
    r16 <cis' gis'>8 cis'16 eis'8 <gis cis'>8 gis4 cis,4 |
    r16 cis,8. r8. bis16 r8 <bis fis'>8 r16 <bis fis'>16 a16 bis16 |
    r8. cis'16 cis,4 r8 ais16 eis16 r16 cis,16 <ais cis'>8 |
    ais,16 cis'8. cis'8 <ais, cis>8 r8 eis16 cis16 r8. cis,16 |
    r4 \tuplet 3/2 { <dis fis ais>8 <dis ais fis'>8 <dis fis ais>8 } fis16 <cis, dis>8 fis16 gis8. gis16 |
    fis16 <gis bis>8 <dis fis bis>16 gis4 r4 cis,4 |
    eis4 ais,16 ais,,16 ais,8 r8 eis16 cis'16 r16 <ais cis'>8. |
    r4 <cis' dis'>8. <g, dis'>16 \tuplet 3/2 { cis'8 cis'8 dis'8 } <ais cis' dis'>8 dis'8 |
    <ais cis' dis'>8 cis'8 <gis,, gis,>16 gis,16 <gis, dis>16 dis,16 <gis, gis>8 eis8 dis4 |
    <gis, eis gis>16 eis8 gis,16 r8. eis,,16 r16 <eis, eis>8 b16 gis8 gis8 |
    ais,8. ais,,16 r8. ais16 gis16 ais8 dis,16 r8. fis16 |
    <fis dis'>8 dis'8 dis4 <a dis'>16 fis,8 a16 r8 a8 |
    a16 <a, cis>16 fis,,16 cis16 cis16 gis,8 gis,16 r8 gis,,8 r4 |
    \clef treble r16 cis'8. <cis' eis'>4 \tuplet 3/2 { cis'8 dis'4 } eis'8 cis'8 |
    <gis cis'>8 <gis cis'>8 cis'8 cis'16 gis16 eis16 <fis bis>8 <eis gis cis'>16 r16 eis16 <cis cis'>16 <dis cis' dis'>16 |
    \clef bass r4 <dis eis cis'>16 cis8 gis16 <cis cis'>8 <gis, gis>8 cis8 fis8 |
    <gis, gis>8 eis8 cis,16 cis16 cis,8 r16 gis,16 dis16 gis,16 r16 gis,,8. |
    gis,,8 gis,8 r4 r4 dis16 gis,8 <gis,, gis,>16 |
    r4 gis,4 r16 dis8 gis,,16 r4 |
    r16 gis,,8. \tuplet 3/2 { r8 gis8 dis8 } r8. cis,16 r4 |
    cis'4 r16 cis'8 gis'16 eis'8. cis'16 r16 <cis ais cis'>8 ais16 |
    <gis cis'>16 ais8 gis16 \tuplet 3/2 { ais4 <cis cis'>8 } \tuplet 3/2 { <cis cis'>8 <cis, ais,>4 } ais,8 gis16 eis16 |
    r16 <cis cis'>16 cis,16 cis16 \tuplet 3/2 { r8 ais,4 } r8 eis8 r8 cis,16 <cis cis'>16 |
    r4 r8 cis,8 cis,8 cis,16 cis'16 r16 eis16 cis'8 |
    r8 cis,8 cis,4 r8 cis,8 r4 |
  \bar "|."
}
\score {
  \new PianoStaff \with { instrumentName = "Piano" } <<
    \new Staff = "up" \right
    \new Staff = "down" \left
  >>
  \layout {
    #(layout-set-staff-size 18)
    \context { \Score \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
  }
}
\score {
  \unfoldRepeats \new PianoStaff <<
    \new Staff = "up" \right
    \new Staff = "down" \left
  >>
  \midi { }
}

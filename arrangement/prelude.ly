\version "2.24.0"
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
    \tempo "Lento" 4 = 52 <c'' g'' c'''>4\fff <aes' ees'' aes''>4 <g' d'' g''>2 |
    r1 |
    <c' ees' g'>2.\pp <c' f' aes'>4 |
    <g ees' g'>4 <bes d' f'>4 <ees c' ees'>2 |
    <d b d'>4 <ees c' ees'>4 <aes d' f'>4 <bes, f bes>4 |
    <g bes ees'>1 |
    <c' ees' g'>2.\p <ees' aes' c''>4 |
    <des' f' bes'>4 <c' f' aes'>4 <b d' g'>2 |
    <aes d' f'>4\< <c' ees' g'>4 <c' f' aes'>4 <d' f' b'>4 |
    <c' ees' g' c''>1\mf |
    <c' ees' g'>2\pp <c' ees' aes'>2 |
    <b d' f' g'>1\fermata |
    \tempo "Agitato" 4 = 100 \tuplet 3/2 { <c' ees' g'>8\mp <ees g c'>8 <g c' ees'>8 } \tuplet 3/2 { <c' ees' aes'>8 <ees g c'>8 <g c' ees'>8 } \tuplet 3/2 { <c' ees' g'>8 <ees g c'>8 <g c' ees'>8 } \tuplet 3/2 { <g c' ees'>8 <c ees g>8 <ees g c'>8 } |
    \tuplet 3/2 { <c' f' aes'>8 <f aes c'>8 <aes c' f'>8 } \tuplet 3/2 { <f' aes' c''>8 <aes c' f'>8 <c' f' aes'>8 } \tuplet 3/2 { <c' f' bes'>8 <f aes c'>8 <aes c' f'>8 } \tuplet 3/2 { <c' f' aes'>8 <f aes c'>8 <aes c' f'>8 } |
    \tuplet 3/2 { <d' f' bes'>8 <f bes d'>8 <bes d' f'>8 } \tuplet 3/2 { <f' bes' d''>8 <bes d' f'>8 <d' f' bes'>8 } \tuplet 3/2 { <f' aes' c''>8 <bes d' f'>8 <d' f' aes'>8 } \tuplet 3/2 { <d' f' bes'>8 <f bes d'>8 <bes d' f'>8 } |
    \tuplet 3/2 { <bes ees' g'>8 <ees g bes>8 <g bes ees'>8 } \tuplet 3/2 { <ees' g' bes'>8 <g bes ees'>8 <bes ees' g'>8 } \tuplet 3/2 { <g' bes' ees''>8 <bes ees' g'>8 <ees' g' bes'>8 } \tuplet 3/2 { <g' bes' d''>8 <bes ees' g'>8 <ees' g' bes'>8 } |
    \tuplet 3/2 { <ees' aes' c''>8 <aes c' ees'>8 <c' ees' aes'>8 } \tuplet 3/2 { <aes' c'' ees''>8 <c' ees' aes'>8 <ees' aes' c''>8 } \tuplet 3/2 { <aes' c'' f''>8 <c' ees' aes'>8 <ees' aes' c''>8 } \tuplet 3/2 { <aes' c'' ees''>8 <c' ees' aes'>8 <ees' aes' c''>8 } |
    \tuplet 3/2 { <f' aes' d''>8 <aes d' f'>8 <d' f' aes'>8 } \tuplet 3/2 { <aes' d'' f''>8 <d' f' aes'>8 <f' aes' d''>8 } \tuplet 3/2 { <aes' c'' ees''>8 <d' f' aes'>8 <f' aes' c''>8 } \tuplet 3/2 { <f' aes' d''>8 <aes d' f'>8 <d' f' aes'>8 } |
    \tuplet 3/2 { <d' g' b'>8\< <g b d'>8 <b d' g'>8 } \tuplet 3/2 { <g' b' d''>8 <b d' g'>8 <d' g' b'>8 } \tuplet 3/2 { <b' d'' g''>8 <d' g' b'>8 <g' b' d''>8 } \tuplet 3/2 { <b' d'' f''>8 <d' g' b'>8 <g' b' d''>8 } |
    \tuplet 3/2 { <g' c'' ees''>8 <c' ees' g'>8 <ees' g' c''>8 } \tuplet 3/2 { <c'' ees'' g''>8 <ees' g' c''>8 <g' c'' ees''>8 } \tuplet 3/2 { <ees'' g'' c'''>8 <g' c'' ees''>8 <c'' ees'' g''>8 } \tuplet 3/2 { <c'' ees'' g''>8 <ees' g' c''>8 <g' c'' ees''>8 } |
    \tuplet 3/2 { <c'' f'' aes''>8\f <f' aes' c''>8 <aes' c'' f''>8 } \tuplet 3/2 { <aes' c'' g''>8 <c' f' aes'>8 <f' aes' c''>8 } \tuplet 3/2 { <aes' c'' f''>8 <c' f' aes'>8 <f' aes' c''>8 } \tuplet 3/2 { <aes' c'' ees''>8 <c' f' aes'>8 <f' aes' c''>8 } |
    \tuplet 3/2 { <aes' des'' f''>8 <des' f' aes'>8 <f' aes' des''>8 } \tuplet 3/2 { <f' aes' des''>8 <aes des' f'>8 <des' f' aes'>8 } \tuplet 3/2 { <f' aes' c''>8 <aes des' f'>8 <des' f' aes'>8 } \tuplet 3/2 { <f' aes' des''>8 <aes des' f'>8 <des' f' aes'>8 } |
    \tuplet 3/2 { <g' b' d''>8\< <b d' g'>8 <d' g' b'>8 } \tuplet 3/2 { <d' g' b'>8 <g b d'>8 <b d' g'>8 } \tuplet 3/2 { <b d' g'>8 <d g b>8 <g b d'>8 } \tuplet 3/2 { <d' g' b'>8 <g b d'>8 <b d' g'>8 } |
    \tuplet 3/2 { <g' b' d''>8 <b d' g'>8 <d' g' b'>8 } \tuplet 3/2 { <b' d'' f''>8 <d' g' b'>8 <g' b' d''>8 } \tuplet 3/2 { <b' d'' g''>8 <d' g' b'>8 <g' b' d''>8 } \tuplet 3/2 { <d'' g'' b''>8 <g' b' d''>8 <b' d'' g''>8 } |
    \tempo "Maestoso" 4 = 58 <g' c'' ees'' g''>2.\fff <aes' c'' f'' aes''>4 |
    <g' ees'' g''>4 <f' d'' f''>4 <ees' c'' ees''>2 |
    <d' b' d''>4 <ees' c'' ees''>4 <f' aes' d'' f''>4 <bes f' bes'>4 |
    <ees' g' bes' ees''>1 |
    <g' c'' ees'' g''>2. <c'' ees'' aes'' c'''>4 |
    <bes' des'' f'' bes''>4 <aes' c'' f'' aes''>4 <g' b' d'' g''>2 |
    <f' aes' d'' f''>4 <g' c'' ees'' g''>4 <aes' c'' f'' aes''>4 <b' d'' f'' b''>4 |
    <c'' ees'' g'' c'''>1\ff |
    \tempo "Lento, morendo" 4 = 48 <c' g' c''>4\pp <aes c' aes'>4 <g c' g'>2 |
    <g b d' f'>2 <g c' ees'>2 |
    <c' f' aes' c''>1 |
    <g c' ees' g'>1\fermata\ppp |
  \bar "|." }
left = { \global \clef bass <>_\markup { \italic "con Ped." }
    <c, g, c>4\fff <aes,, ees, aes,>4 <g,, d, g,>2 |
    <c,, g,, c,>1\fermata |
    <c, g, c>4\pp <g, c ees>4 <g, c ees>4 <aes, c f>4 |
    <ees, g, ees>4 <bes, d f>4 <aes,, ees, aes,>4 <aes, c ees>4 |
    <g,, d, g,>4 <c, g, c>4 <bes,, f, bes,>4 <bes,, f, aes,>4 |
    <ees,, bes,, ees,>2 <bes,, g, bes,>2 |
    <c, g, c>4 <g, c ees>4 <g, c ees>4 <aes, c ees>4 |
    <f, bes, f>4 <aes, c f>4 <g,, d, g,>4 <g, b, d>4 |
    <aes,, d, aes,>4 <g, c g>4 <f, c f>4 <g,, d, g,>4 |
    <c,, g,, c,>1 |
    <c, g, c>4 <aes,, ees, aes,>4 <g,, c, g,>2 |
    <g,, d, g,>1\fermata |
    <c,, g,, c,>4\mp <g,, c, g,>4 <ees,, g,, ees,>4 <g,, c, g,>4 |
    <f,, c, f,>4 <c, f, c>4 <aes,, c, aes,>4 <c, f, c>4 |
    <bes,, f, bes,>4 <f,, bes,, f,>4 <d,, aes,, d,>4 <f,, bes,, f,>4 |
    <ees,, bes,, ees,>4 <bes,, ees, bes,>4 <g,, ees, g,>4 <bes,, ees, bes,>4 |
    <aes,, ees, aes,>4 <ees, aes, ees>4 <c, aes, c>4 <ees, aes, ees>4 |
    <d,, aes,, d,>4 <aes,, d, aes,>4 <f,, c, f,>4 <aes,, d, aes,>4 |
    <g,, d, g,>4 <d, g, d>4 <b,, f, b,>4 <d, g, d>4 |
    <c,, g,, c,>4 <g,, c, g,>4 <ees,, g,, ees,>4 <g,, c, g,>4 |
    <aes,, c, aes,>4 <c, f, c>4 <f,, c, f,>4 <c, f, c>4 |
    <des,, aes,, des,>4 <aes,, des, aes,>4 <f,, des, f,>4 <aes,, des, aes,>4 |
    <g,, d, g,>4 <d, g, d>4 <b,, f, b,>4 <d, g, d>4 |
    <g,, d, g,>4 <d,, g,, d,>4 <g,, d, g,>4 <b,, f, b,>4 |
    <c,, g,, c,>4\fff <g, c ees>4 <g, c ees>4 <aes, c f>4 |
    <ees,, g,, ees,>4 <bes, d f>4 <aes,, ees, aes,>4 <aes, c ees>4 |
    <g,, d, g,>4 <c, g, c>4 <bes,, f, bes,>4 <bes,, aes, bes,>4 |
    <ees,, bes,, ees,>2 <bes,, g, bes,>2 |
    <c, g, c>4 <g, c ees>4 <g, c ees>4 <aes, c ees>4 |
    <f,, bes,, f,>4 <aes, c f>4 <g,, d, g,>4 <g, b, d>4 |
    <aes,, d, aes,>4 <g,, c, g,>4 <f,, c, f,>4 <g,, d, g,>4 |
    <c,, g,, c,>1 |
    <c,, g,, c,>1\pp |
    <g,, d, g,>2 <c, g, c>2 |
    <c,, f,, c,>1 |
    <c,, c, g,>1\fermata |
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

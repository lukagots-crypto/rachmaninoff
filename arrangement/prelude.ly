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
    \tempo "Lento" 4 = 52 <c'' c'''>4\fff <aes' aes''>4 <g' g''>2 |
    r1 |
    <c' ees' g'>2.\pp <c' f' aes'>4 |
    <ees' g'>4 <d' f'>4 <c' ees'>2 |
    <b d'>4 <c' ees'>4 <aes d' f'>4 <f bes>4 |
    <g bes ees'>1 |
    <c' ees' g'>2.\p <ees' aes' c''>4 |
    <des' f' bes'>4 <c' f' aes'>4 <b d' g'>2 |
    <aes d' f'>4\< <c' ees' g'>4 <c' f' aes'>4 <d' f' b'>4 |
    <c' ees' g' c''>1\mf |
    <c' ees' g'>2\pp <c' ees' aes'>2 |
    <b d' f' g'>1\fermata |
    \tempo "Agitato" 4 = 100 \tuplet 3/2 { g'8\mp ees'8 c'8 } \tuplet 3/2 { aes'8 g'8 ees'8 } \tuplet 3/2 { g'8 ees'8 c'8 } \tuplet 3/2 { ees'8 c'8 g8 } |
    \tuplet 3/2 { aes'8 f'8 c'8 } \tuplet 3/2 { c''8 aes'8 f'8 } \tuplet 3/2 { bes'8 aes'8 f'8 } \tuplet 3/2 { aes'8 f'8 c'8 } |
    \tuplet 3/2 { bes'8 aes'8 f'8 } \tuplet 3/2 { d''8 bes'8 aes'8 } \tuplet 3/2 { c''8 bes'8 aes'8 } \tuplet 3/2 { bes'8 aes'8 f'8 } |
    \tuplet 3/2 { g'8 ees'8 bes8 } \tuplet 3/2 { bes'8 g'8 ees'8 } \tuplet 3/2 { ees''8 bes'8 g'8 } \tuplet 3/2 { d''8 bes'8 g'8 } |
    \tuplet 3/2 { c''8 aes'8 ees'8 } \tuplet 3/2 { ees''8 c''8 aes'8 } \tuplet 3/2 { f''8 ees''8 c''8 } \tuplet 3/2 { ees''8 c''8 aes'8 } |
    \tuplet 3/2 { d''8 c''8 aes'8 } \tuplet 3/2 { f''8 d''8 c''8 } \tuplet 3/2 { ees''8 d''8 c''8 } \tuplet 3/2 { d''8 c''8 aes'8 } |
    \tuplet 3/2 { b'8\< g'8 f'8 } \tuplet 3/2 { d''8 b'8 g'8 } \tuplet 3/2 { g''8 f''8 d''8 } \tuplet 3/2 { f''8 d''8 b'8 } |
    \tuplet 3/2 { ees''8 c''8 g'8 } \tuplet 3/2 { g''8 ees''8 c''8 } \tuplet 3/2 { c'''8 g''8 ees''8 } \tuplet 3/2 { g''8 ees''8 c''8 } |
    \tuplet 3/2 { aes''8\f f''8 c''8 } \tuplet 3/2 { g''8 f''8 c''8 } \tuplet 3/2 { f''8 c''8 aes'8 } \tuplet 3/2 { ees''8 c''8 aes'8 } |
    \tuplet 3/2 { f''8 des''8 aes'8 } \tuplet 3/2 { des''8 aes'8 f'8 } \tuplet 3/2 { c''8 aes'8 f'8 } \tuplet 3/2 { des''8 aes'8 f'8 } |
    \tuplet 3/2 { d''8\< b'8 g'8 } \tuplet 3/2 { b'8 g'8 f'8 } \tuplet 3/2 { g'8 f'8 d'8 } \tuplet 3/2 { b'8 g'8 f'8 } |
    \tuplet 3/2 { d''8 b'8 g'8 } \tuplet 3/2 { f''8 d''8 b'8 } \tuplet 3/2 { g''8 f''8 d''8 } \tuplet 3/2 { b''8 g''8 f''8 } |
    \tempo "Maestoso" 4 = 58 <g' c'' ees'' g''>2.\fff <aes' c'' f'' aes''>4 |
    <g' ees'' g''>4 <f' d'' f''>4 <ees' c'' ees''>2 |
    <d' b' d''>4 <ees' c'' ees''>4 <f' aes' d'' f''>4 <bes f' bes'>4 |
    <ees' g' bes' ees''>1 |
    <g' c'' ees'' g''>2. <c'' ees'' aes'' c'''>4 |
    <bes' des'' f'' bes''>4 <aes' c'' f'' aes''>4 <g' b' d'' g''>2 |
    <f' aes' d'' f''>4 <g' c'' ees'' g''>4 <aes' c'' f'' aes''>4 <b' d'' f'' b''>4 |
    <c'' ees'' g'' c'''>1\ff |
    \tempo "Lento, morendo" 4 = 48 <c' c''>4\pp <aes aes'>4 <g g'>2 |
    <g b d' f'>2 <g c' ees'>2 |
    <c' f' aes' c''>1 |
    <g c' ees' g'>1\fermata\ppp |
  \bar "|." }
left = { \global \clef bass <>_\markup { \italic "con Ped." }
    <c, c>4\fff <aes,, aes,>4 <g,, g,>2 |
    <c,, c,>1\fermata |
    c,4\pp <g, c ees>4 <g, c ees>4 <aes, c f>4 |
    ees,4 <bes, d f>4 aes,4 <aes, c ees>4 |
    <g,, g,>4 <c, g,>4 <bes,, f,>4 <bes,, aes,>4 |
    <ees,, ees,>2 <bes,, g,>2 |
    <c, c>4 <g, c ees>4 <g, c ees>4 <aes, c ees>4 |
    f,4 <aes, c f>4 <g,, g,>4 <g, b, d>4 |
    <aes,, aes,>4 g,4 f,4 <g,, g,>4 |
    <c,, c,>1 |
    <c, c>4 <aes,, aes,>4 <g,, g,>2 |
    <g,, g,>1\fermata |
    <c,, c,>4\mp <g,, g,>4 <ees,, ees,>4 <g,, g,>4 |
    <f,, f,>4 <c, c>4 <aes,, aes,>4 <c, c>4 |
    <bes,, bes,>4 <f,, f,>4 <d,, d,>4 <f,, f,>4 |
    <ees,, ees,>4 <bes,, bes,>4 <g,, g,>4 <bes,, bes,>4 |
    <aes,, aes,>4 <ees, ees>4 <c, c>4 <ees, ees>4 |
    <d,, d,>4 <aes,, aes,>4 <f,, f,>4 <aes,, aes,>4 |
    <g,, g,>4 <d, d>4 <b,, b,>4 <d, d>4 |
    <c,, c,>4 <g,, g,>4 <ees,, ees,>4 <g,, g,>4 |
    <aes,, aes,>4 <c, c>4 <f,, f,>4 <c, c>4 |
    <des,, des,>4 <aes,, aes,>4 <f,, f,>4 <aes,, aes,>4 |
    <g,, g,>4 <d, d>4 <b,, b,>4 <d, d>4 |
    <g,,, g,,>4 <d,, d,>4 <g,, g,>4 <b,, b,>4 |
    <c,, c,>4\fff <g, c ees>4 <g, c ees>4 <aes, c f>4 |
    <ees,, ees,>4 <bes, d f>4 <aes,, aes,>4 <aes, c ees>4 |
    <g,, g,>4 <c, g,>4 <bes,, f,>4 <bes,, aes,>4 |
    <ees,, ees,>2 <bes,, g,>2 |
    <c, c>4 <g, c ees>4 <g, c ees>4 <aes, c ees>4 |
    <f,, f,>4 <aes, c f>4 <g,, g,>4 <g, b, d>4 |
    <aes,, aes,>4 <g,, g,>4 <f,, f,>4 <g,, g,>4 |
    <c,, c,>1 |
    <c,, c,>1\pp |
    <g,, g,>2 <c, c>2 |
    <c,, c,>1 |
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

// Styled image — clean yellow → red linear gradient border carries the
// brand pair (.dot-grid + .notch-corner motifs from style.css) without
// over-stating either color alone.

#let styled-image(
  path,
  caption: none,
  width: 100%,
  primaryColor: rgb("#bd2835"),    // VU SA red
  accentColor: rgb("#fbb01b"),     // VU SA yellow
) = {
  figure(
    box(
      width: 100%,
      inset: 0.2em,
      stroke: (
        thickness: 1.5pt,
        paint: gradient.linear(
          angle: 90deg,
          accentColor,
          primaryColor,
        ),
      ),
      radius: 3pt,
      clip: true,
      image(path, width: width)
    ),
    caption: if caption != none [
      #caption
    ],
    supplement: none
  )
}

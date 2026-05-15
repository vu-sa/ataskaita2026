// Stat card — yellow top edge (energy cue, matches the web period-underline
// motif), red value, ink label, thin red hairline at the bottom.

#let stat-card(
  value: "",
  label: "",
  icon: none,
  primaryColor: rgb("#bd2835"),    // VU SA red
  accentColor: rgb("#fbb01b"),     // VU SA yellow
) = {
  box(
    width: 100%,
    fill: white,
    stroke: (
      top: 3pt + accentColor,
      bottom: 0.6pt + primaryColor,
    ),
    radius: 0pt,
    inset: (x: 0.8em, y: 1em),
  )[
    #align(center)[
      #if icon != none {
        align(center, image(icon, width: 2.3em))
        v(0.6em)
      }
      #text(
        size: 2.1em,
        weight: "bold",
        fill: primaryColor.darken(5%),
      )[#value]

      #v(0.4em)
      #text(
        size: 1em,
        weight: "regular",
        fill: rgb("#1c1517").lighten(25%),
      )[#label]
    ]
  ]
}

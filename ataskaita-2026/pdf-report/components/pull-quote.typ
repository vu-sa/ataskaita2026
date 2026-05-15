// Pull-quote — warm-band surface with a red left edge (callout pattern)
// and yellow decorative quote marks. Together red + yellow balance the
// brand identity in editorial breakouts.

#let pull-quote(
  quote-text: "",
  author: none,
  primaryColor: rgb("#bd2835"),
  accentColor: rgb("#fbb01b"),
) = {
  block(
    fill: rgb("#fdf2e4"),
    stroke: (left: 3pt + primaryColor),
    radius: 0pt,
    width: 100%,
    inset: (x: 1.5em, y: 1em),
  )[
    #align(center)[
      #text(
        size: 2.5em,
        style: "italic",
        fill: accentColor.darken(10%),
      )[“]
      #h(0.1em)
      #text(
        size: 1.15em,
        style: "italic",
        fill: rgb("#1c1517").lighten(15%),
      )[#quote-text]
      #h(0.1em)
      #text(
        size: 2.5em,
        style: "italic",
        fill: accentColor.darken(10%),
      )[”]

      #if author != none [
        #v(0.8em)
        #align(right)[
          #text(
            size: 0.9em,
            weight: "semibold",
            style: "italic",
            fill: primaryColor.darken(5%),
          )[— #author]
        ]
      ]
    ]
  ]
}

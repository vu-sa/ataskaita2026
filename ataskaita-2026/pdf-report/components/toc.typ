// TOC — echoes the H1 treatment from layout.typ:
// red eyebrow above an ink-colored title, with a short yellow accent bar.

#let styled-toc(
  header: "Turinys",
  eyebrow: "Turinys",
  primaryColor: rgb("#bd2835"),
  accentColor: rgb("#fbb01b"),
  secondaryAccent: rgb("#1c1517"),
) = {
  block(
    inset: (x: 2.5em, y: 1.5em),
  )[
    #align(center)[
      // Eyebrow (red tick + uppercase letterspaced text)
      #grid(
        columns: (auto, auto),
        column-gutter: 0.7em,
        align: horizon,
        rect(width: 28pt, height: 3pt, fill: primaryColor, stroke: none),
        text(
          font: "Atkinson Hyperlegible",
          size: 0.85em,
          weight: "bold",
          fill: primaryColor,
          tracking: 0.18em,
        )[#upper(eyebrow)]
      )
      #v(0.6em)
      #text(
        weight: "extrabold",
        size: 2.2em,
        fill: secondaryAccent,
        tracking: -0.02em,
      )[#header]
      #v(0.4em)
      // Short yellow accent bar (.report-hero__period::after motif)
      #rect(width: 2.5em, height: 4pt, fill: accentColor, stroke: none)
    ]
    #v(1em)

    #outline(
      indent: auto,
      title: [],
      depth: 2,
    )
  ]
}

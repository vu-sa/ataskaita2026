// End page — mirrors the title page: light background with a dot-grid,
// red eyebrow + yellow accent bar above ink-colored thanks text, and the
// shared red+yellow two-band bottom stripe.

#import "title-page.typ": dot-grid-bg

#let end-page(
  thanks-text: "Ačiū",
  logo: none,
  primaryColor: rgb("#bd2835"),    // VU SA red
  accentColor: rgb("#fbb01b"),     // VU SA yellow
  secondaryAccent: rgb("#1c1517"), // Ink
  eyebrow: "VU SA",
) = {
  page(
    margin: (x: 0mm, y: 0mm),
    fill: white,
  )[
    // Dot-grid backdrop
    #place(left + top, dx: 0pt, dy: 0pt, dot-grid-bg())

    // Soft radial fade so dots concentrate behind the thanks text
    #place(left + top, dx: 0pt, dy: 0pt,
      rect(
        width: 100%, height: 100%,
        fill: gradient.radial(
          white.transparentize(100%),
          white.transparentize(60%),
          white,
          center: (50%, 50%),
          radius: 75%,
        ),
        stroke: none,
      )
    )

    // Logo, centered near the top
    #if logo != none {
      place(center + top, dy: 30mm)[
        #image(logo, height: 45mm)
      ]
    }

    // Eyebrow with red tick
    #place(center + top, dy: 110mm)[
      #grid(
        columns: (auto, auto),
        column-gutter: 0.7em,
        align: horizon,
        rect(width: 24pt, height: 3pt, fill: primaryColor, stroke: none),
        text(
          font: "Atkinson Hyperlegible",
          size: 0.85em,
          weight: "bold",
          fill: primaryColor,
          tracking: 0.18em,
        )[#upper(eyebrow)]
      )
    ]

    // Thanks text — ink-colored, extrabold, centered
    #place(center + top, dy: 130mm)[
      #block(width: 75%)[
        #align(center)[
          #set par(leading: 0.4em)
          #text(
            fill: secondaryAccent,
            font: "Atkinson Hyperlegible",
            weight: "extrabold",
            size: 3.6em,
            tracking: -0.01em,
          )[#thanks-text]
        ]
      ]
    ]

    // Yellow accent bar under the thanks text
    #place(center + top, dy: 200mm)[
      #align(center)[
        #rect(width: 2.5em, height: 4pt, fill: accentColor, stroke: none)
      ]
    ]

    // Bottom red + yellow two-band stripe
    #place(left + bottom, dx: 0pt, dy: -2mm,
      rect(width: 100%, height: 2mm, fill: accentColor, stroke: none))
    #place(left + bottom, dx: 0pt, dy: -5mm,
      rect(width: 100%, height: 3mm, fill: primaryColor, stroke: none))
  ]
}

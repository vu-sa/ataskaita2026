// Title page — light editorial hero mirroring the web index <ReportHero>.
// Tokens (red + yellow + ink) are passed in as primaryColor / accentColor /
// secondaryAccent.

// Render a dot-grid backdrop by placing circles in a grid. Universally
// compatible across Typst versions (no `tiling`/`pattern` dependency).
#let dot-grid-bg(
  width: 210mm,
  height: 297mm,
  spacing: 22pt,
  dot-radius: 0.7pt,
  dot-color: rgb(189, 40, 53, 41),
) = {
  let cols = calc.ceil(width / spacing)
  let rows = calc.ceil(height / spacing)
  box(width: 100%, height: 100%, clip: true,
    for row in range(rows) {
      for col in range(cols) {
        place(
          left + top,
          dx: col * spacing,
          dy: row * spacing,
          circle(radius: dot-radius, fill: dot-color, stroke: none),
        )
      }
    }
  )
}

#let title-page(
  title: "",
  subtitle: "",
  logo: none,
  primaryColor: rgb("#bd2835"),    // VU SA red
  accentColor: rgb("#fbb01b"),     // VU SA yellow
  secondaryAccent: rgb("#1c1517"), // Ink
  date: none,
  eyebrow: "Vieningai už studentų (-čių) ateitį!",
) = {
  page(
    margin: (x: 0mm, y: 0mm),
    fill: white,
  )[
    // Dot-grid backdrop (.dot-grid motif from style.css)
    #place(left + top, dx: 0pt, dy: 0pt, dot-grid-bg())

    // Soft radial fade — concentrates dots behind the title
    #place(left + top, dx: 0pt, dy: 0pt,
      rect(
        width: 100%, height: 100%,
        fill: gradient.radial(
          white.transparentize(100%),
          white.transparentize(60%),
          white,
          center: (50%, 45%),
          radius: 75%,
        ),
        stroke: none,
      )
    )

    // Logo, centered near the top
    #if logo != none {
      place(center + top, dy: 22mm)[
        #image(logo, height: 55mm)
      ]
    }

    // Eyebrow with red tick (.section-eyebrow motif)
    #place(center + top, dy: 100mm)[
      #box(inset: 0pt)[
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
    ]

    // Main title — ink-colored, extrabold, centered
    #place(center + top, dy: 118mm)[
      #block(width: 75%)[
        #align(center)[
          #set par(leading: 0.4em)
          #text(
            fill: secondaryAccent,
            font: "Atkinson Hyperlegible",
            weight: "extrabold",
            size: 4.2em,
            tracking: -0.02em,
          )[#title]
        ]
      ]
    ]

    // Period (subtitle) + yellow accent bar — .report-hero__period::after
    #place(center + top, dy: 195mm)[
      #align(center)[
        #text(
          font: "Atkinson Hyperlegible",
          weight: "bold",
          size: 1.4em,
          fill: primaryColor,
          tracking: 0.04em,
        )[#subtitle]
        #v(0.6em)
        #rect(width: 2.5em, height: 4pt, fill: accentColor, stroke: none)
      ]
    ]

    // Date, bottom right, muted ink
    #if date != none {
      place(right + bottom, dx: -25mm, dy: -25mm)[
        #text(
          fill: secondaryAccent.lighten(40%),
          font: "Atkinson Hyperlegible",
          weight: "medium",
          size: 1em,
        )[#date]
      ]
    }

    // Two-band red + yellow stripe at the bottom
    #place(left + bottom, dx: 0pt, dy: -2mm,
      rect(width: 100%, height: 2mm, fill: accentColor, stroke: none))
    #place(left + bottom, dx: 0pt, dy: -5mm,
      rect(width: 100%, height: 3mm, fill: primaryColor, stroke: none))
  ]

  pagebreak()
}

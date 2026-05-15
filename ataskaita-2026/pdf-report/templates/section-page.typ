// Section divider page — full-bleed photo with a left-aligned
// transparent title block. Mirrors the editorial rhythm of the web index:
// section eyebrow + bold title + yellow accent bar.

#let section-page(
  title: "",
  bg-image: none,
  eyebrow: none,                       // Optional uppercase tag above the title
  primaryColor: rgb("#bd2835"),        // VU SA red
  accentColor: rgb("#fbb01b"),         // VU SA yellow
  secondaryAccent: rgb("#1c1517"),     // Ink
  create_heading: true,
) = {
  set par(leading: 0.4em)

  page(
    margin: (x: 0mm, y: 0mm),
    fill: white,
  )[
    // --- Background ---
    #if bg-image != none {
      // Photo with a soft top-to-bottom darkening overlay so the title reads
      // clearly without hiding the image.
      place(top + left, dx: 0pt, dy: 0pt,
        box(width: 100%, height: 100%, clip: true,
          align(center + horizon)[
            #image(bg-image, width: 100%, height: 100%, fit: "cover")
            #place(
              top + left,
              dx: 0pt, dy: 0pt,
              rect(
                width: 100%, height: 100%,
                fill: gradient.linear(
                  angle: 180deg,
                  secondaryAccent.transparentize(90%),   // ~10% opacity top
                  secondaryAccent.transparentize(75%),   // ~25% mid
                  secondaryAccent.transparentize(15%),   // ~85% opacity bottom (title area)
                ),
                stroke: none,
              )
            )
          ]
        )
      )
    } else {
      // Fallback: deep red gradient if no photo is provided
      place(top + left, dx: 0pt, dy: 0pt,
        rect(
          width: 100%, height: 100%,
          fill: gradient.linear(
            angle: 160deg,
            primaryColor.darken(20%),
            primaryColor,
            primaryColor.darken(5%),
          ),
          stroke: none,
        )
      )
    }

    // --- Title block (transparent, left-aligned, lower third) ---
    #place(left + bottom, dx: 22mm, dy: -28mm)[
      #block(width: 80%)[
        // Eyebrow: yellow tick + (optional) uppercase letterspaced text
        #if eyebrow != none and eyebrow != "" [
          #grid(
            columns: (auto, auto),
            column-gutter: 0.7em,
            align: horizon,
            rect(width: 28pt, height: 3pt, fill: accentColor, stroke: none),
            text(
              font: "Atkinson Hyperlegible",
              size: 0.9em,
              weight: "bold",
              fill: accentColor,
              tracking: 0.18em,
            )[#upper(eyebrow)]
          )
          #v(0.6em)
        ] else [
          #rect(width: 28pt, height: 3pt, fill: accentColor, stroke: none)
          #v(0.6em)
        ]

        // Title — white, extrabold, no background block. The gradient overlay
        // above carries the contrast (~85% darkened ink near the title row).
        #set par(leading: 0.45em)
        #if create_heading and title != "" {
          show heading: it => {
            text(
              font: "Atkinson Hyperlegible",
              size: 4em,
              weight: "extrabold",
              fill: white,
            )[#it.body]
          }
          heading(level: 1, title)
        } else {
          text(
            font: "Atkinson Hyperlegible",
            size: 4em,
            weight: "extrabold",
            fill: white,
          )[#title]
        }

        #v(0.5em)
        // Yellow accent bar under the title
        #rect(width: 2.5em, height: 4pt, fill: accentColor, stroke: none)
      ]
    ]

    // --- Two-band red + yellow bottom stripe ---
    #place(left + bottom, dx: 0pt, dy: -2mm,
      rect(width: 100%, height: 2mm, fill: accentColor, stroke: none))
    #place(left + bottom, dx: 0pt, dy: -5mm,
      rect(width: 100%, height: 3mm, fill: primaryColor, stroke: none))
  ]

  pagebreak()
}

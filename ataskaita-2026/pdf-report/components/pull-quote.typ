#let pull-quote(
  quote-text: "",
  author: none,
  primaryColor: rgb("#fbad13"),
  accentColor: rgb("#b5333e"),
) = {
  block(
    fill: primaryColor.lighten(95%), // Very light primary fill
    radius: 2pt, // Slightly smaller radius
    width: 100%,
    inset: (x: 1.5em, y: 1em), // Adjusted inset
    // stroke: (bottom: 1pt + primaryColor.lighten(70%)) // Optional: very subtle bottom border
  )[
    #align(center)[
      #text(
        size: 2.5em, // Larger, more stylized quote marks
        style: "italic",
        fill: primaryColor.darken(10%)
      )[“] // Using typographic quotes
      #h(0.1em) // Less horizontal space
      #text(
        size: 1.15em, // Adjusted to new base font size
        style: "italic",
        fill: black.lighten(25%) // Softer text color
      )[#quote-text]
      #h(0.1em)
      #text(
        size: 2.5em,
        style: "italic",
        fill: primaryColor.darken(10%)
      )[”] // Using typographic quotes
      
      #if author != none [
        #v(0.8em) // More space before author
        #align(right)[
          #text(
            size: 0.9em,
            weight: "semibold", // Semibold for author
            style: "italic",    // Italic author
            fill: accentColor.darken(15%) // Accent color for author
          )[— #author]
        ]
      ]
    ]
  ]
}

#let styled-toc(header: "Turinys", primaryColor: rgb("#fbad13"), accentColor: rgb("#b5333e")) = {
  block(
    inset: (x: 2.5em, y: 1.5em),
  )[
    #align(center)[
      #text(
        weight: "bold",
        size: 2em, // Increased size, similar to H1
        fill: primaryColor.darken(10%), // Darker primary for better contrast
      )[#header]
      #v(0.4em) // Space between title and line
      #line(
        length: 60%, // Line length
        stroke: 2.5pt + primaryColor.darken(5%) // Line style consistent with H1
      )
    ]
    #v(1em) // Space between title block and outline
    
    // Use the basic outline functionality that works with all versions
    #outline(
      indent: auto,
      title: [],
      // Styling for outline entries is mostly inherited from heading styles in layout.typ
    )
  ]
}

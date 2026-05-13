// Template for VU SA Annual Report

// Template function for creating a styled project document
#let project(
  title: "",
  authors: (),
  date: auto,
  description: none,
  keywords: (),
  language: "lt",
  primaryColor: rgb("#1A1A1A"),  // Default to dark black
  accentColor: rgb("#fbad13"),   // Default to amber-gold
  secondaryAccent: rgb("#b5333e"), // Default to red
  body
) = {
  // Set the document's basic properties
  set document(
    author: authors, 
    title: title, 
    date: date,
    description: description, 
    keywords: keywords
  )
  set text(lang: language)
  set page(
    margin: (left: 25mm, right: 25mm, top: 22mm, bottom: 22mm), // Slightly adjusted margins
    numbering: "1" // Remove default numbering as we'll add custom one
  )
  
  // ---- Apply text styles
  set text(font: "Atkinson Hyperlegible", size: 11.5pt) // Slightly smaller base font for a denser, modern feel

  // Paragraphs configuration
  set par(justify: false, leading: 0.7em) // Adjusted leading
  
  // Link styling
  show link: it => [
    #text(fill: accentColor.darken(10%), weight: "semibold")[#it] // Darker accent for links
  ]
  
  // Block quote styling
  show quote: block.with(
    fill: primaryColor.lighten(92%), // Lighter fill
    radius: 3pt, // Slightly larger radius
    inset: (x: 1.2em, y: 0.9em), // Adjusted inset
    stroke: (left: 2.5pt + primaryColor.darken(5%)) // Thinner, slightly darker border
  )
  
  // Figure styling
  show figure: it => {
    set align(center)
    
    block(
      width: 100%,
      inset: (y: 0.8em), // Increased vertical inset
      radius: 3pt,
      fill: none,
    )[
      #it.body
      
      #if it.caption != none {
        block(
          width: 95%, // Wider caption block
          inset: (top: 0.5em, bottom: 0.2em), // Adjusted caption inset
        )[
          #set text(size: 0.85em, style: "italic", fill: black.lighten(30%)) // Softer caption text
          #align(center)[#it.caption]
        ]
      }
    ]
  }
  
  // Table styling
  show table: it => {
    set table(
      stroke: 0.3pt + black.lighten(70%), // Lighter stroke
      fill: (_, row) => if row == 0 { primaryColor.lighten(85%) } else if calc.odd(row) { black.lighten(98%) } else { white }, // Subtle primary color in header
      inset: (x: 0.8em, y: 0.6em), // Adjusted inset
    )
    
    show table.header: row => {
      set text(fill: accentColor.darken(15%), weight: "bold", size: 0.95em) // Accent color for header text
      row
    }
    
    it
  }
  
  // Apply heading styles
  set heading(numbering: "1.1")
  show heading: it => [
    #v(1.2em, weak: true) // Adjusted vertical spacing, weak to allow collapsing
    #block[
      #set text(weight: "bold")
      #if it.level == 1 [
        #set text(size: 2em, fill: primaryColor.darken(15%)) // Larger, darker primary for H1
        #it.body
        #line(
          length: 100%,
          stroke: 2.5pt + primaryColor.darken(5%) // Thicker line, slightly darker
        )
        #v(0.3em) // Space after line
      ] else if it.level == 2 [
        #set text(size: 1.4em, fill: accentColor.darken(10%)) // Larger, darker accent for H2
        #it.body
        #line(
          length: 50%, // Slightly longer line
          stroke: 2pt + accentColor // Thinner line for H2
        )
        #v(0.2em) // Space after line
      ] else [ // H3 and below
        #v(0.8em) // Space before text
        #box(
          fill: none,
          stroke: (left: 2.5pt + primaryColor.lighten(20%)), // Slightly thicker, lighter border
          inset: (left: 0.6em, top: 0.1em, bottom: 0.1em), // Adjusted inset
        )[
          #set text(size: 1.15em, weight: "semibold", fill: black.lighten(10%)) // Semibold, slightly lighter black
          #it.body
        ]
        #v(0.8em) // Space after text
      ]
    ]
    #v(0.6em, weak: true) // Adjusted vertical spacing
  ]
  
  // Main body
  body
}

#let two-columns(
  left: [],
  right: [],
  ratio: (1, 1),
) = {
  grid(
    columns: (ratio.at(0) * 1fr, ratio.at(1) * 1fr),
    column-gutter: 2.5em, // Slightly reduced gutter
    align: horizon,
    left,
    right
  )
}

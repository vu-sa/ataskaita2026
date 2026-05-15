// Template for VU SA Annual Report
// Design tokens mirrored from .vitepress/theme/style.css

// Template function for creating a styled project document
#let project(
  title: "",
  authors: (),
  date: auto,
  description: none,
  keywords: (),
  language: "lt",
  primaryColor: rgb("#bd2835"),    // VU SA red — primary brand
  accentColor: rgb("#fbb01b"),     // VU SA yellow — editorial accent
  secondaryAccent: rgb("#1c1517"), // Ink — for body / dark text
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
  set text(font: "Atkinson Hyperlegible", size: 11.5pt, fill: secondaryAccent)

  // Paragraphs configuration
  set par(justify: false, leading: 0.7em)

  // Link styling — red, semibold (web links are yellow but red is more legible on white)
  show link: it => [
    #text(fill: primaryColor, weight: "semibold")[#it]
  ]

  // Block quote — warm band fill + red left edge, matches .custom-block.tip
  show quote: block.with(
    fill: rgb("#fdf2e4"),
    radius: 0pt,
    inset: (x: 1.2em, y: 0.9em),
    stroke: (left: 3pt + primaryColor)
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
  
  // Apply heading styles — echo the web index design language:
  // ink-colored bold titles with short yellow accent bars (matches
  // .vp-doc > div > h1:first-child::after in style.css).
  set heading(numbering: "1.1")
  show heading: it => [
    #v(1.2em, weak: true)
    #block[
      #set text(weight: "bold")
      #if it.level == 1 [
        #set text(size: 2em, fill: secondaryAccent)
        #it.body
        #v(0.3em)
        #line(length: 2.5em, stroke: 4pt + accentColor)
        #v(0.2em)
      ] else if it.level == 2 [
        #set text(size: 1.4em, fill: secondaryAccent)
        #it.body
        #v(0.25em)
        #line(length: 1.8em, stroke: 3pt + accentColor)
        #v(0.1em)
      ] else [
        #v(0.8em)
        #box(
          fill: none,
          stroke: (left: 3pt + accentColor),
          inset: (left: 0.6em, top: 0.1em, bottom: 0.1em),
        )[
          #set text(size: 1.15em, weight: "semibold", fill: secondaryAccent)
          #it.body
        ]
        #v(0.8em)
      ]
    ]
    #v(0.6em, weak: true)
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

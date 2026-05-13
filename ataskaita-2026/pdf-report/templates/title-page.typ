#let title-page(
  title: "",
  subtitle: "",
  logo: none,
  primaryColor: rgb("#1A1A1A"),  // Default to dark black
  accentColor: rgb("#fbad13"),   // Default to amber-gold
  secondaryAccent: rgb("#b5333e"), // Default to red
  date: none,
) = {
  page(
    margin: (x: 0mm, y: 0mm),
    fill: white, // Base fill, though parts will be covered
  )[
    // --- Background Elements ---
    // Dominant primary color block covering the entire page
    #place(left + top, dx: 0pt, dy: 0pt)[
      #rect(width: 100%, height: 100%, fill: primaryColor) // Changed height to 100%
    ]

    // Accent strip removed as background covers full height now
    
    // --- Content Elements ---
    // Logo: Small, positioned at top-left within margin
    #if logo != none {
      place(left + top, dx: 13mm, dy: 20mm)[
      #image(logo, width: 20%) // Significantly smaller logo
      ]
    }

    // Main Title: Large, bold, and contrasting
    #place(left + top, dx: 20mm, dy: 35%)[
      #block(width: 70%)[
        // Splitting title for potential multi-line effect if very long
        #let title_words = title.split(" ")
        #let half = calc.ceil(title_words.len() / 2)
        #let line1 = title_words.slice(0, half).join(" ")
        #let line2 = title_words.slice(half).join(" ")

        #text(
          fill: white, // Contrast against primaryColor background
          font: "Atkinson Hyperlegible", 
          weight: "extrabold", // Very bold
          size: 5.5em, // Significantly larger title
          // leading: 0.8em, // Tight leading for large text
        )[#line1]
        #if line2 != "" [
          #par(justify: false)[
             #text(
              fill: white, 
              font: "Atkinson Hyperlegible", 
              weight: "extrabold", 
              size: 5.5em,
              // leading: 0.8em,
            )[#line2]
          ]
        ]
      ]
    ]

    // Subtitle: Positioned below the title, smaller, using accent or contrasting color
    #place(left + top, dx: 20mm, dy: 62%)[
      #block(width: 60%)[
        #text(
          fill: accentColor.lighten(10%), // Accent color for subtitle
          font: "Atkinson Hyperlegible",
          weight: "semibold",
          size: 1.8em, // Smaller subtitle
        )[#subtitle]
      ]
    ]

    // Date: Minimalist, at the bottom right of the primary color block
    #if date != none {
      place(right + top, dx: -20mm, dy: 70%)[
        #text(
          fill: primaryColor.lighten(40%), // Subtle against primary
          font: "Atkinson Hyperlegible",
          weight: "medium",
          size: 1.1em,
        )[#date]
      ]
    }
  ]
  
  pagebreak()
}

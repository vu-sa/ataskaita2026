#let end-page(
  thanks-text: "Ačiū",
  logo: none,
  primaryColor: rgb("#1A1A1A"),  // Default to dark black
  accentColor: rgb("#fbad13"),   // Default to amber-gold
  secondaryAccent: rgb("#b5333e"), // Default to red
) = {
  page(
    margin: (x: 0mm, y: 0mm),
    fill: white, // Base fill, though parts will be covered
  )[
    // --- Background Elements ---
    // Dominant primary color block covering the entire page (same as title page)
    #place(left + top, dx: 0pt, dy: 0pt)[
      #rect(width: 100%, height: 100%, fill: primaryColor) // Full page background
    ]
    
    // Thin accent strip at bottom for subtle branding (similar to section page)
    #place(left + bottom, dx: 0pt, dy: 0pt)[
      #rect(width: 100%, height: 5mm, fill: accentColor)
    ]

    // --- Content Elements ---
    // Logo: Small, positioned at top-left within margin (same as title page)
    #if logo != none {
      place(left + top, dx: 13mm, dy: 20mm)[
        #image(logo, width: 20%) // Same size as title page
      ]
    }

    // "Thank You" Text: Large, bold, and contrasting (matching title page style)
    #place(left + top, dx: 20mm, dy: 55%)[
      #block(width: 70%)[
        // Splitting text for potential multi-line effect if very long (like title page)
        #let thanks_words = thanks-text.split(" ")
        #let half = calc.ceil(thanks_words.len() / 2)
        #let line1 = thanks_words.slice(0, half).join(" ")
        #let line2 = thanks_words.slice(half).join(" ")

        #set par(leading: 0.4em)

        #text(
          fill: white, // Contrast against primaryColor background
          font: "Atkinson Hyperlegible", 
          weight: "extrabold", // Very bold
          size: 4.5em, // Same size as title page
        )[#thanks-text]
      ]
    ]

    // Small accent text at bottom (in place of the subtitle on title page)
    #place(left + bottom, dx: 20mm, dy: -25mm)[
      #block(width: 60%)[
        #text(
          fill: accentColor.lighten(10%), // Accent color for visual consistency
          font: "Atkinson Hyperlegible",
          weight: "semibold",
          size: 1.8em, // Same size as subtitle on title page
        )[VU SA]
      ]
    ]
  ]
  // No pagebreak here, as it's the final page.
}

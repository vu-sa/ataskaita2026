#let section-page(
  title: "",
  bg-image: none,
  primaryColor: rgb("#1A1A1A"),  // Default to dark black
  accentColor: rgb("#fbad13"),   // Default to amber-gold
  secondaryAccent: rgb("#b5333e"), // Default to red
  create_heading: true, // Parameter to control whether to create a semantic heading
) = {
set par(
  leading: 0.4em,  
)
// Create the decorative section page
  page(
    margin: (x: 0mm, y: 0mm),
    fill: white, // Base fill for the page
  )[
    // --- Bold Background Elements ---
    // Full-page primary dark color background
    #place(left + top, dx: 100pt, dy: 0pt)[
      #rect(width: 100%, height: 100%, fill: primaryColor) 
    ]
    
    // Gradient overlay for visual interest
    #place(left + top, dx: 0pt, dy: 0pt)[
      #rect(
        width: 100%, 
        height: 100%, 
        fill: gradient.linear(
          angle: 160deg,
          primaryColor.darken(10%),
          primaryColor,
          primaryColor.lighten(10%)
        )
      )
    ]
    
    // Thin accent line at the bottom for subtle branding
    #place(left + bottom, dx: 0pt, dy: 0pt)[
      #rect(width: 100%, height: 5mm, fill: accentColor)
    ]
    
    // Image with lighter overlay if provided - photos should be clearly seen
    #if bg-image != none {
      place(
        top,
        dx: 0pt, dy: 0pt,
        box(
          width: 100%,
          height: 100%, // Cover the entire page
          clip: true,
          align(center + horizon)[
            #image(bg-image, width: 100%, height: 100%, fit: "cover")
            
            // Lighter, gradient overlay that allows photos to be more visible
            #place(
              center,
              box(
                width: 100%,
                height: 100%,
                fill: gradient.linear(
                  angle: 180deg, // Top to bottom gradient
                  primaryColor.opacify(15%), // Very transparent at top
                  primaryColor.opacify(25%), // Slightly more visible in middle
                  primaryColor.opacify(85%)  // More opaque at bottom where text will be
                ),
              )
            )
          ]
        )
      )
    } else {
      // Deep gradient background if no image is provided
      place(
        top,
        rect(
          width: 100%, height: 100%,
          fill: gradient.linear(
            angle: 160deg,
            primaryColor.darken(20%),
            primaryColor,
            primaryColor.lighten(5%),
          )
        )
      )
    }
    
    // Section title with bold styling - left-aligned and in the lower part
    #place(
      left + bottom,
      dy: -12mm, // Position from bottom (further up to be in the lower part but not at very bottom)
      box(
        width: 90%, // Slightly narrower for better left alignment
        inset: (x: 2.2em, y: 2em), // Adjusted padding
        fill: primaryColor.darken(5%), // Dark background
        stroke: (
          bottom: (thickness: 3pt, paint: accentColor), // Bottom border
          rest: (thickness: 0pt) // No other borders
        ),
        radius: 3pt, // Slightly rounded corners
      )[
        #align(left)[
          // Depending on create_heading, either use a semantic heading or just styled text
          #if create_heading and title != "" {
            // Use a semantic heading but override its style
show heading: it => {
              text(
                font: "Atkinson Hyperlegible", // Match title page font
                size: 2.8em, // Larger size for impact
                weight: "extrabold", // Heavy weight for boldness
                fill: white, // White text for high contrast
                it.body
              )
            }
            
            heading(level: 1, title)
          } else {
            // Just styled text for visual display but no semantic heading
            text(
              font: "Atkinson Hyperlegible", // Match title page font
              size: 4em, // Larger size for impact
              weight: "extrabold", // Heavy weight for boldness
              fill: white, // White text for high contrast
              title
            )
          }
        ]
      ]
    )
  ]
  
  pagebreak()
}

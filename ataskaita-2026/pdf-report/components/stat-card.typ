#let stat-card(
  value: "",
  label: "",
  icon: none,
  primaryColor: rgb("#fbad13"),
  accentColor: rgb("#b5333e"),
) = {
  box(
    width: 100%,
    fill: white,
    stroke: (
      top: 2.5pt + primaryColor.darken(5%), // Slightly thinner, darker top stroke
      // Optional: Add a very subtle full border for definition
      // rest: 0.5pt + black.lighten(90%)
    ),
    radius: 2pt, // Slightly smaller radius for a sharper look
    inset: (x: 0.8em, y: 1em), // Adjusted inset for better spacing
    // Add a light shadow if desired and easily supported, for now using borders
  )[
    #align(center)[
      #if icon != none {
        // Icon styling: Using accentColor for visual interest
        align(center, image(icon, width: 2.3em)) // Slightly smaller icon
        v(0.6em) // Adjusted spacing
      }
      #text(
        size: 2.1em, // Slightly adjusted value size
        weight: "bold",
        fill: primaryColor.darken(10%) // Darker primary for better contrast
      )[#value]
      
      #v(0.4em) // Adjusted spacing
      #text(
        size: 1em, // Adjusted label size
        weight: "regular", // Regular weight for a cleaner look than medium
        fill: black.lighten(30%) // Softer label color
      )[#label]
    ]
  ]
}

#let callout(
  title: none,
  body,
  icon: none,
  type: "info",
  primaryColor: rgb("#1A1A1A"),
  accentColor: rgb("#fbad13"),
) = {
  // Define custom styles based on type
  let bg-color = accentColor.lighten(85%)
  let border-color = accentColor
  let title-color = accentColor.darken(10%)
  let icon-text = ""

  if type == "warning" {
    border-color = rgb("#f59e0b")
    bg-color = rgb("#f59e0b").lighten(85%)
    title-color = rgb("#f59e0b").darken(10%)
    icon-text = "⚠️"
  } else if type == "error" {
    border-color = rgb("#ef4444")
    bg-color = rgb("#ef4444").lighten(85%)
    title-color = rgb("#ef4444").darken(10%)
    icon-text = "❌"
  } else if type == "success" {
    border-color = rgb("#10b981")
    bg-color = rgb("#10b981").lighten(85%)
    title-color = rgb("#10b981").darken(10%)
    icon-text = "✓"
  } else {
    // Default info
    icon-text = "ℹ️"
  }

  // Use custom icon if provided
  if icon != none {
    icon-text = icon
  }

  // Construct the callout block
  block(
    width: 100%,
    fill: bg-color,
    stroke: (left: 4pt + border-color),
    radius: 3pt,
    inset: (x: 1.2em, y: 1em),
  )[
    #if title != none {
      block(
        spacing: 0.5em,
      )[
        #text(weight: "bold", size: 1.1em, fill: title-color)[#icon-text #h(0.3em) #title]
      ]
    } else if icon != none {
      block(
        spacing: 0.5em,
      )[
        #text(weight: "bold", size: 1.1em, fill: title-color)[#icon-text]
      ]
    }
    
    #body
  ]
}

// Callout — mirrors the web .custom-block.tip:
// warm-band fill, red left edge, no emoji on the default info style.

#let callout(
  title: none,
  body,
  icon: none,
  type: "info",
  primaryColor: rgb("#bd2835"),   // VU SA red
  accentColor: rgb("#fbb01b"),    // VU SA yellow
) = {
  let brand-band = rgb("#fdf2e4")

  // Default (info): warm band + red left edge, no emoji prefix
  let bg-color = brand-band
  let border-color = primaryColor
  let title-color = primaryColor.darken(5%)
  let icon-text = ""

  if type == "warning" {
    border-color = rgb("#f59e0b")
    bg-color = rgb("#f59e0b").lighten(85%)
    title-color = rgb("#f59e0b").darken(10%)
    icon-text = "⚠"
  } else if type == "error" {
    border-color = rgb("#ef4444")
    bg-color = rgb("#ef4444").lighten(85%)
    title-color = rgb("#ef4444").darken(10%)
    icon-text = "✕"
  } else if type == "success" {
    border-color = rgb("#10b981")
    bg-color = rgb("#10b981").lighten(85%)
    title-color = rgb("#10b981").darken(10%)
    icon-text = "✓"
  }

  // Explicit icon override always wins
  if icon != none {
    icon-text = icon
  }

  block(
    width: 100%,
    fill: bg-color,
    stroke: (left: 4pt + border-color),
    radius: 0pt,
    inset: (x: 1.2em, y: 1em),
  )[
    #if title != none {
      block(spacing: 0.5em)[
        #text(weight: "bold", size: 1.1em, fill: title-color)[
          #if icon-text != "" [#icon-text #h(0.3em)]
          #title
        ]
      ]
    } else if icon != none and icon-text != "" {
      block(spacing: 0.5em)[
        #text(weight: "bold", size: 1.1em, fill: title-color)[#icon-text]
      ]
    }

    #body
  ]
}

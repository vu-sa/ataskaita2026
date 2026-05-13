// Goal progress indicators for visualizing goal completion
#let goal-progress(
  title: "",
  current: 0,
  target: 100,
  primaryColor: rgb("#fbad13"),
  accentColor: rgb("#b5333e"),
) = {
  // Calculate percentage completed
  let percentage = calc.min(calc.round((current / target) * 100), 100)
  
  // Determine status color based on completion
  let status-color = if percentage < 30 {
    rgb("#ef4444") // Red for low completion
  } else if percentage < 70 {
    primaryColor // Yellow/amber for medium completion
  } else {
    rgb("#22c55e") // Green for high completion
  }
  
  block(
    width: 100%,
    fill: white,
    radius: 4pt,
    stroke: (paint: primaryColor.lighten(70%), thickness: 1pt),
    inset: 1.5em,
  )[
    // Title and completion percentage
    #grid(
      columns: (auto, 1fr, auto),
      column-gutter: 1em,
      
      text(weight: "bold", fill: primaryColor.darken(10%))[#title],
      
      line(
        length: 100%,
        stroke: (dash: "dotted", paint: primaryColor.lighten(50%))
      ),
      
      box(
        fill: status-color.lighten(80%),
        stroke: (paint: status-color),
        radius: 4pt,
        inset: (x: 0.6em, y: 0.3em),
      )[
        #text(size: 0.9em, weight: "bold", fill: status-color)[#percentage%]
      ]
    )
    
    #v(1em)
    
    // Progress bar
    #block(
      width: 100%,
      height: 1.2em,
      radius: 10pt,
      fill: black.lighten(90%),
      stroke: (paint: black.lighten(80%), thickness: 0.5pt),
    )[
      #place(
        top + left,
        block(
          height: 100%,
          width: percentage * 1%,
          fill: gradient.linear(
            angle: 90deg,
            status-color.lighten(20%),
            status-color
          ),
          radius: (left: 10pt, right: if percentage == 100 { 10pt } else { 0pt }),
        )
      )
    ]
    
    #v(0.8em)
    
    // Current vs target values
    #block(
      width: 100%,
      inset: (top: 0.3em),
    )[
      #grid(
        columns: (1fr, auto),
        
        text(
          size: 0.9em,
        )[#current / #target],
        
        text(
          size: 0.9em,
          style: "italic",
          fill: black.lighten(30%),
        )[Tikslas]
      )
    ]
  ]
}

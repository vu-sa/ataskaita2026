// Budget visualization component for financial transparency
#let budget-visualization(
  categories: (),
  amounts: (),
  total: none,
  primaryColor: rgb("#fbad13"),
  accentColor: rgb("#b5333e"),
) = {
  // Calculate percentages and total if not provided
  let calculated-total = if total == none {
    amounts.fold(0, (acc, val) => acc + val)
  } else {
    total
  }
  
  let percentages = amounts.map(amount => calc.round((amount / calculated-total) * 100))
  
  // Generate distinct colors for categories
  let colors = (
    primaryColor,
    accentColor,
    primaryColor.lighten(20%),
    accentColor.lighten(20%),
    primaryColor.darken(20%),
    accentColor.darken(20%),
    rgb("#22c55e"), // green
    rgb("#3b82f6"), // blue
    rgb("#8b5cf6"), // purple
    rgb("#ec4899"), // pink
  )
  
  // Ensure we have enough colors
  while colors.len() < categories.len() {
    colors.push(colors.at(colors.len() % 5).lighten(10 * calc.floor(colors.len() / 5)))
  }
  
  block(
    width: 100%,
    fill: white,
    radius: 4pt,
    stroke: (paint: primaryColor.lighten(70%), thickness: 1pt),
    inset: 1.5em,
  )[
    // Title and total
    #grid(
      columns: (1fr, auto),
      
      text(weight: "bold", size: 1.2em, fill: primaryColor.darken(10%))[Biudžeto paskirstymas],
      
      block(
        fill: primaryColor.lighten(90%),
        radius: 2pt,
        inset: (x: 0.8em, y: 0.4em),
        stroke: (paint: primaryColor),
      )[
        #text(weight: "bold")[Viso: #calculated-total €]
      ]
    )
    
    #v(1.5em)
    
    // Bar chart visualization
    #block(
      width: 100%,
      height: 2em,
      radius: 4pt,
      clip: true,
    )[
      // Calculate widths for segments
      #let current-x = 0%
      
      #for (i, percentage) in percentages.enumerate() {
        place(
          top + left,
          dx: current-x,
          block(
            height: 100%,
            width: percentage * 1%,
            fill: colors.at(i),
          )
        )
        
        // Update x position for next segment
        current-x = current-x + percentage * 1%
      }
    ]
    
    #v(2em)
    
    // Legend with category breakdown
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 1em,
      column-gutter: 2em,
      
      ..categories.enumerate().map(((i, category)) => {
        grid(
          columns: (auto, 1fr, auto),
          column-gutter: 0.6em,
          
          // Color box
          block(
            width: 1em,
            height: 1em,
            fill: colors.at(i),
            radius: 2pt,
          )[],
          
          // Category name
          text(size: 0.9em)[#category],
          
          // Amount and percentage
          align(right)[
            #text(weight: "bold", size: 0.9em)[#amounts.at(i) €]
            #h(0.3em)
            #text(size: 0.8em, fill: black.lighten(40%))[#percentages.at(i)%]
          ]
        )
      })
    )
  ]
}

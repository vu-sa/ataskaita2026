#let timeline-item(
  content: "",
  index: 1,
  type: "default",
  primaryColor: rgb("#bd2835"),
  accentColor: rgb("#fbb01b"),
  is-last: false,
  english: false,
) = {
  // Get status text and color based on type
  let status = ""
  let dot-color = rgb("#d9d9d9")
  let dot-fill = white
  let status-text-color = black
  
  if type == "success" {
    status = if english { "implemented" } else { "įgyvendinta" }
    dot-color = rgb("#52c41a")  // Green color for success
    status-text-color = rgb("#52c41a").darken(20%)
  } else if type == "warning" {
    status = if english { "under implementation" } else { "įgyvendinama" }
    dot-color = rgb("#fbb01b")  // Amber color for warning/in progress
    status-text-color = rgb("#fbb01b").darken(10%)
  } else if type == "not-planned" {
    status = if english { "abandoned" } else { "atsisakyta" }
    dot-color = rgb("#d9d9d9")  // Gray for abandoned
    status-text-color = rgb("#777777")
  } else if type == "error" {
    status = if english { "not implemented" } else { "neįgyvendinta" }
    dot-color = rgb("#ff4d4f")  // Red for error/not implemented
    status-text-color = rgb("#ff4d4f").darken(10%)
  } else {
    status = if english { "in progress" } else { "bus vykdoma" }
    dot-color = rgb("#d9d9d9")  // Gray for default
    status-text-color = rgb("#777777")
  }
  
  let title-prefix = if english { "Task " } else { " uždavinys: " }
  let title = if english {
    [Task #index: #text(fill: status-text-color, weight: "medium")[#status]]
  } else {
    [#index uždavinys: #text(fill: status-text-color, weight: "medium")[#status]]
  }
  
  // Container to hold the timeline dot and line
  box(width: 100%, inset: 0pt, outset: 0pt)[
    // Calculate consistent positions
    #let dot-size = 15pt
    #let dot-radius = dot-size / 2
    #let line-width = 1pt
    #let dot-x = -20pt
    #let dot-y = 2pt
    #let line-x = dot-x + dot-radius - (line-width / 2)
    
    // Draw vertical line first (below the dot) if not the last item
    #if not is-last {
      place(
        top + left,
        dx: line-x,
        dy: dot-y + dot-size,
        box(
          height: 35pt,
          width: line-width,
          fill: rgb(189, 40, 53, 41)  // brandHairline — visual continuity with web .dot-grid
        )
      )
    }
    
    // Then draw the dot (so it appears on top of the line)
    #place(
      top + left,
      dx: dot-x, 
      dy: dot-y,
      box(
        width: dot-size,
        height: dot-size,
        stroke: 2pt + dot-color,
        radius: 50%,
        fill: white
      )
    )
    
    // Title and content with improved spacing
    #pad(left: 12pt)[
      // Title with improved weight
      #text(weight: "bold", title)
      
      // Add a small space between title and content
      #v(3pt)
      
      // Content with improved size and line height
      #text(size: 0.9em, fill: rgb("#333333"))[#content]
    ]
    
    // Add consistent space after each item
    #v(25pt)
  ]
}

#let goal-timeline(
  items: (),
  primaryColor: rgb("#bd2835"),
  accentColor: rgb("#fbb01b"),
  english: false
) = {
  // Timeline container with improved padding
  block(inset: (top: 8pt, bottom: 8pt), width: 100%)[
    #pad(left: 25pt)[
      #for (i, item) in items.enumerate() {
        timeline-item(
          content: item.content,
          index: i + 1,
          type: item.at("type", default: "default"),
          primaryColor: primaryColor,
          accentColor: accentColor,
          is-last: i == items.len() - 1,
          english: english
        )
      }
    ]
  ]
}

#let goal-results(
  content,
  header: none,
  primaryColor: rgb("#bd2835"),
  accentColor: rgb("#fbb01b"),
  english: false
) = {
  let default-header = if english { "What was implemented?" } else { "Kas įgyvendinta?" }
  let display-header = if header == none { default-header } else { header }

  // Mirrors .custom-block.tip: warm-band fill, red left edge, red header.
  block(
    width: 100%,
    fill: rgb("#fdf2e4"),
    stroke: (left: 4pt + primaryColor),
    radius: 0pt,
    inset: (x: 1.2em, y: 1em),
  )[
    #grid(
      columns: (auto, auto),
      column-gutter: 0.5em,
      align: horizon,
      rect(width: 18pt, height: 3pt, fill: primaryColor, stroke: none),
      text(weight: "bold", size: 1.1em, fill: primaryColor)[#display-header],
    )
    #v(0.4em)
    #content
  ]
}

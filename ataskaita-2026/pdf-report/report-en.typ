#import "@preview/cmarker:0.1.5"

// Import main template functionality from templates/layout.typ
#import "templates/layout.typ": project, two-columns
#import "templates/title-page.typ": title-page
#import "templates/section-page.typ": section-page
#import "templates/end-page.typ": end-page

// Import component blocks for document structure and content
#import "components/toc.typ": styled-toc
#import "components/image.typ": styled-image
#import "components/stat-card.typ": stat-card
#import "components/pull-quote.typ": pull-quote
#import "components/team-avatars.typ": team-avatars-grid, team-section
#import "components/csv-utils.typ": load-csv, get-persons-by-role, get-persons-by-column
#import "components/callout.typ": callout
#import "components/timeline.typ": goal-timeline, goal-results

// Define main colors from brand guidelines (New Scheme)
#let brandBlack = rgb("#1A1A1A") // A very dark, almost black for primary text & elements
#let brandGold = rgb("#fbad13")   // Amber/gold as a primary accent
#let brandRed = rgb("#b5333e")    // Dark red as a secondary accent

// Redefine theme colors for the project setup
#let primaryColor = brandBlack   // Main operations will use black
#let accentColor = brandGold     // Main accent will be gold
// brandRed will be used explicitly where needed

// Helper functions to read file content with more flexibility
#let sanitize_markdown_for_pdf(content) = {
  return content
    .split("\n")
    .filter(line => not line.contains("initiative-logo"))
    .join("\n")
}

// Original line-based function (maintained for backwards compatibility)
#let read_file_lines(
  file_path, 
  start: 0,  // Start line (0-based index, 0 means first line)
  end: none  // End line (none means read until the end)
) = {
  let content = read(file_path)
  let lines = content.split("\n")

  if start >= lines.len() {
    return ""
  }

  // If end is not specified, read until the end of the file
  let end_line = if end == none or end > lines.len() { lines.len() } else { end }

  // Select the requested range and join back together
  return sanitize_markdown_for_pdf(lines.slice(start, end_line).join("\n"))
}

// New section-based function that looks for section markers in markdown files
#let read_file_section(
  file_path,
  section_id: none,     // ID of section to extract (required if heading is not provided)
  heading: none,        // Heading text to search for (alternative to section_id)
  heading_level: none,  // Heading level to search for (e.g., 1 for #, 2 for ##)
  include_markers: false // Whether to include section markers in output
) = {
  let content = read(file_path)
  
  // Return entire file if no filters specified
  if section_id == none and heading == none {
    return sanitize_markdown_for_pdf(content)
  }

  // Try section marker approach if section_id is provided
  if section_id != none {
    // Define section markers
    let start_marker = "<!-- SECTION:" + section_id + ":START -->"
    let end_marker = "<!-- SECTION:" + section_id + ":END -->"
    
    // Find section boundaries
    let start_pos = content.position(start_marker)
    
    if start_pos != none {
      let search_start = start_pos + start_marker.len()
      let end_pos = content.slice(search_start).position(end_marker)
      
      if end_pos != none {
        // Calculate actual end position
        let actual_end = search_start + end_pos
        
        // Extract section content with or without markers
        if include_markers {
          return sanitize_markdown_for_pdf(content.slice(start_pos, actual_end + end_marker.len()))
        } else {
          return sanitize_markdown_for_pdf(content.slice(search_start, actual_end).trim())
        }
      }
    }
  }
  
  // Try heading approach if heading is provided or if section_id approach failed
  if heading != none {
    let lines = content.split("\n")
    let heading_marker = ""
    
    // Build heading marker pattern
    if heading_level != none {
      heading_marker = "#".repeat(heading_level) + " " + heading
    }
    
    // Find heading position
    let start_index = -1
    for i in range(lines.len()) {
      let line = lines.at(i).trim()
      
      if heading_level != none {
        // Exact heading level match
        if line.starts-with(heading_marker) {
          start_index = i
          break
        }
      } else {
        // Any heading level with matching text
        if line.starts-with("#") and line.contains(heading) {
          start_index = i
          break
        }
      }
    }
    
    if start_index != -1 {
      // Find next heading of same or higher level (if applicable)
      let end_index = lines.len()
      
      if heading_level != none {
        for i in range(start_index + 1, lines.len()) {
          let line = lines.at(i).trim()
          if line.starts-with("#") {
            let line_heading_level = line.find("#").len()
            if line_heading_level <= heading_level {
              end_index = i
              break
            }
          }
        }
      }
      
      // Extract section content
      return sanitize_markdown_for_pdf(lines.slice(start_index, end_index).join("\n").trim())
    }
  }
  
  // Fall back to returning entire file content if no matches found
  return sanitize_markdown_for_pdf(content)
}

// Store the actual build date (today's date)
#let build_date = datetime.today()

// Add build date to keywords to preserve in PDF metadata
#let extended_keywords = ("VU SR", "student representation", "yearly report", "Vilnius University", "student representation", "2025-2026", "build_date:" + build_date.display())

#show: project.with(
  title: "VU SR Yearly Report 2025-2026",
  date: datetime(year: 2026, month: 5, day: 16),  // Publication date shown in document
  description: "Report on the activities of Vilnius University Student Representation for the 2025-2026 academic year.",
  keywords: extended_keywords,
  language: "en",
  primaryColor: primaryColor,
  accentColor: accentColor,
  secondaryAccent: brandRed,
)

#title-page(
  title: "VU SR  Yearly Report 2025-2026",
  subtitle: "Academic Year 2025-2026",
  logo: "../src/public/img/logos/vusa-lt-w.png",
  primaryColor: primaryColor,
  accentColor: accentColor,
  secondaryAccent: brandRed,
  date: "May 2026"
)

#image(
  "./src/public/img/people/kleja-mercaityte.jpg",
  width: 50%,
)

#cmarker.render(read_file_section("./src/en/prezidentes-kalba.md", section_id: "presidents-letter"), h1-level: 2)

#pagebreak()

#styled-toc(
  header: "Table of Contents",
  primaryColor: primaryColor,
  accentColor: accentColor
)

///// --- DATA
//
// Load data from CSV file
#let padaliniai_data = load-csv("../src/data/padaliniai.csv")
#let dariniai_data = load-csv("../src/data/dariniai.csv")

// Filter data to get specific member groups using the same patterns as in the Vue component
#let pirmininkai = get-persons-by-role(padaliniai_data, ("Pirminink", "l.e.p. Pirminink"))
#let prezidente = get-persons-by-role(dariniai_data, "Prezidentė").at(0)
#let updated-prezidente = {
  (
    ..prezidente, 
    fullTerm: true
  )
}
#let taryba = (updated-prezidente, ..pirmininkai)
#let revizijos-komisija = get-persons-by-column(dariniai_data, "Darinys", "Revizijos komisija")

///////

#section-page(
  title: "Congratulatory words",
  bg-image: "../src/public/img/gallery/VU SA 24-25-01.jpg",
  primaryColor: primaryColor,
  accentColor: accentColor,
)

// Rector

#image(
  "src/public/img/congrats/rimvydas-petrauskas.jpg",
  width: 70%,
)

#v(1em)

#cmarker.render(read_file_section("./src/en/sveikinimai.md", section_id: "rektorius"), h1-level: 2)

#pagebreak()

// Senate

#image(
  "src/public/img/congrats/egle-lastauskiene.jpg",
  width: 55%,
)

#v(1em)

#cmarker.render(read_file_section("./src/en/sveikinimai.md", section_id: "senatas"), h1-level: 2)

#pagebreak()

// Seimas

#image(
  "src/public/img/congrats/jurgita-sukeviciene.jpg",
  width: 70%,
)

#v(1em)

#cmarker.render(read_file_section("./src/en/sveikinimai.md", section_id: "seimas"), h1-level: 2)

#pagebreak()

// Academic Ethics

#image(
  "src/public/img/congrats/reda-cimmperman.jpg",
  width: 70%,
)

#v(1em)

#cmarker.render(read_file_section("./src/en/sveikinimai.md", section_id: "aekpk"), h1-level: 2)

#pagebreak()

// SKVC

#image(
  "src/public/img/congrats/zinaida-manzuch.jpg",
  width: 70%,
)

#v(1em)

#cmarker.render(read_file_section("./src/en/sveikinimai.md", section_id: "skvc"), h1-level: 2)

#pagebreak()

// Library

#image(
  "src/public/img/congrats/irena-kriviene.png",
  width: 50%,
)

#v(1em)

#cmarker.render(read_file_section("./src/en/sveikinimai.md", section_id: "biblioteka"), h1-level: 2)

#pagebreak()

// ARQUS

#image(
  "src/public/img/congrats/arqus-studentu-taryba.png",
  width: 100%,
)

#v(1em)

#cmarker.render(read_file_section("./src/en/sveikinimai.md", section_id: "arqus"), h1-level: 2)

// START OF MAIN CONTENT

#section-page(
  title: "VU SR structure and activities",
  bg-image: "../src/public/img/gallery/VU SA 24-25-12.jpg",
  primaryColor: primaryColor,
  accentColor: accentColor,
)

// TODO: pridėti strategijos photo.

#cmarker.render(read_file_lines("./src/en/strategija.md", start: 2), h1-level: 2)

#pagebreak()

== VU SR Parliament

#team-section(
  photo: "../src/public/img/dariniai/Parlamentas.jpg",
  columns: 2,
  primaryColor: primaryColor,
  accentColor: accentColor,
  showTitle: false,
  showPadalinys: true,
)

#callout(
  primaryColor: primaryColor,
  accentColor: accentColor,
)[
#cmarker.render(read_file_lines("./src/en/vu-sa/parlamentas.md", start: 5, end: 18))
  ]

VU SR Parliament was chaired by Gabrielė Kasperaitė.

#callout(
  primaryColor: rgb("#1A1A1A"),
  accentColor: rgb("#cccccc"),
)[
  2025-2026 m. VU SR Parliament consisted of... 

#cmarker.render(read_file_lines("./src/en/vu-sa/parlamentas.md", start: 24, end: 40))
  ]

#cmarker.render(read_file_lines("./src/en/vu-sa/parlamentas.md", start: 43), h1-level: 2)

#pagebreak()

== Board

#team-section(
  photo: "../src/public/img/dariniai/Taryba.jpg",
  members: taryba,
  columns: 2,
  primaryColor: primaryColor,
  accentColor: accentColor,
  showTitle: false,
  showPadalinys: true,
)

#callout(
  primaryColor: primaryColor,
  accentColor: accentColor,
)[
  *VU SR Board* is 
#cmarker.render(read_file_lines("./src/en/vu-sa/taryba.md", start: 22, end: 23))
  ]

#cmarker.render(read_file_lines("./src/en/vu-sa/taryba.md", start: 31))

#pagebreak()

== Revision Commission

#team-section(
  photo: "../src/public/img/dariniai/Revizija.jpg",
  members: revizijos-komisija,
  columns: 2,
  primaryColor: primaryColor,
  accentColor: accentColor,
  showTitle: true,
  showPadalinys: false,
)

#cmarker.render(read_file_lines("./src/en/vu-sa/revizijos-komisija.md", start: 14))

#pagebreak()

== Institutional Strengthening Fund

#callout(
  primaryColor: primaryColor,
  accentColor: accentColor,
)[
  *VU SR Institutional Strengthening Fund* is 
#cmarker.render(read_file_lines("./src/en/vu-sa/isf.md", start: 14, end: 15))
  ]

*In 2025-2026 the Institutional Strengthening Fund team included:*

#team-section(
  photo: "../src/public/img/dariniai/ISF.jpg",
  members: get-persons-by-column(dariniai_data, "Darinys", "Institucinio stiprinimo fondas"),
  columns: 2,
  primaryColor: primaryColor,
  accentColor: accentColor,
  showTitle: true,
  showPadalinys: false,
)

#cmarker.render(read_file_lines("./src/en/vu-sa/isf.md", start: 17))

#pagebreak()

== Data Protection Group

#team-section(
  photo: "../src/public/img/dariniai/DAG.jpg",
  members: get-persons-by-column(dariniai_data, "Darinys", "VU SA Duomenų apsaugos grupė"),
  columns: 2,
  primaryColor: primaryColor,
  accentColor: accentColor,
  showTitle: true,
  showPadalinys: false,
)

#cmarker.render(read_file_lines("./src/en/vu-sa/dag.md", start: 18))

#section-page(
  title: "Representation",
  bg-image: "../src/public/img/gallery/VU SA 24-25-01.jpg",
  primaryColor: primaryColor,
  accentColor: accentColor,
)

#cmarker.render(read_file_lines("./src/en/kokybiskos-studijos/nacionalinis.md"), h1-level: 2)

#v(2em)

#cmarker.render(read_file_lines("./src/en/kokybiskos-studijos/vu.md"), h1-level: 2)

#pagebreak()

#cmarker.render(read_file_lines("./src/en/kokybiskos-studijos/bendradarbiavimas.md", start: 0), h1-level: 2)

#pagebreak()

#cmarker.render(read_file_lines("./src/en/kokybiskos-studijos/tarptautinis.md", start: 0), h1-level: 2)

#cmarker.render(read_file_lines("./src/en/kokybiskos-studijos/rastai.md", start: 0), h1-level: 2)

#section-page(
  title: "Strategic goals",
  bg-image: "../src/public/img/gallery/VU SA 24-25-23.jpg",
  primaryColor: primaryColor,
  accentColor: accentColor,
)

#let goals_data = json("src/data/goalsEN.json")

== Implementation of the VU SR 2025-2026 Strategic Guidelines

// 1

#cmarker.render(read_file_lines("./src/en/mvp/strateginiai.md", start: 7, end: 12), h1-level: 2)

#goal-timeline(
  items: goals_data.at("1"),
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true

)

#goal-results(
  header: "What was accomplished?",
  primaryColor: primaryColor,
  accentColor: accentColor
)[
#cmarker.render(read_file_lines("./src/en/mvp/strateginiai.md", start: 18, end: 46), h1-level: 2)
]

// 2

#cmarker.render(read_file_lines("./src/en/mvp/strateginiai.md", start: 49, end: 54), h1-level: 2)

#goal-timeline(
  items: goals_data.at("2"),
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true

)

#goal-results(
  header: "What was accomplished?",
  primaryColor: primaryColor,
  accentColor: accentColor
)[
#cmarker.render(read_file_lines("./src/en/mvp/strateginiai.md", start: 60, end: 89), h1-level: 2)
]

// 3

#cmarker.render(read_file_lines("./src/en/mvp/strateginiai.md", start: 93, end: 97), h1-level: 2)

#goal-timeline(
  items: goals_data.at("3"),
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true

)

#goal-results(
  header: "What was accomplished?",
  primaryColor: primaryColor,
  accentColor: accentColor
)[
#cmarker.render(read_file_lines("./src/en/mvp/strateginiai.md", start: 103, end: 144), h1-level: 2)
]

#pagebreak()

== Goals in VU SR units

// 4

#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 7, end: 8), h1-level: 2)

#goal-timeline(
  items: goals_data.at("4"),
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true

)

#goal-results(
  header: "What was accomplished?",
  primaryColor: primaryColor,
  accentColor: accentColor
)[
#cmarker.render(read_file_lines("./src/en/mvp/strateginiai.md", start: 14, end: 33), h1-level: 2)
]

// 5

#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 36, end: 37), h1-level: 2)

#goal-timeline(
  items: goals_data.at("5"),
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true

)

#goal-results(
  header: "What was accomplished?",
  primaryColor: primaryColor,
  accentColor: accentColor
)[
#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 43, end: 57), h1-level: 2)
]

// 6

#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 60, end: 61), h1-level: 2)

#goal-timeline(
  items: goals_data.at("6"),
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true

)

#goal-results(
  header: "What was accomplished?",
  primaryColor: primaryColor,
  accentColor: accentColor
)[
#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 67, end: 88), h1-level: 2)
]

// 7

#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 91, end: 92), h1-level: 2)

#goal-timeline(
  items: goals_data.at("7"),
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true

)

#goal-results(
  header: "What was accomplished?",
  primaryColor: primaryColor,
  accentColor: accentColor
)[
#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 98, end: 108), h1-level: 2)
]

// 8

#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 111, end: 112), h1-level: 2)

#goal-timeline(
  items: goals_data.at("8"),
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true

)

#goal-results(
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true

)[
#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 117, end: 136), h1-level: 2)
]

// 9

#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 139, end: 140), h1-level: 2)

#goal-timeline(
  items: goals_data.at("9"),
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true

)

#goal-results(
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true

)[
#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 145, end: 168), h1-level: 2)
]

// 10

#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 171, end: 172), h1-level: 2)

#goal-timeline(
  items: goals_data.at("10"),
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true

)

#goal-results(
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true

)[
#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 177, end: 203), h1-level: 2)
]

// 11

#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 206, end: 207), h1-level: 2)

#goal-timeline(
  items: goals_data.at("11"),
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true

)

#goal-results(
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true

)[
#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 212, end: 221), h1-level: 2)
]

// 12

#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 225, end: 226), h1-level: 2)

#goal-timeline(
  items: goals_data.at("12"),
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true
)

#goal-results(
  primaryColor: primaryColor,
  accentColor: accentColor
)[
#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 231, end: 251), h1-level: 2)
]

// 13

#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 253, end: 254), h1-level: 2)

#goal-timeline(
  items: goals_data.at("13"),
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true
)

#goal-results(
  primaryColor: primaryColor,
  accentColor: accentColor
)[
#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 260, end: 284), h1-level: 2)
]

// 14

#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 287, end: 288), h1-level: 2)

#goal-timeline(
  items: goals_data.at("14"),
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true
)

#goal-results(
  primaryColor: primaryColor,
  accentColor: accentColor
)[
#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 294, end: 304), h1-level: 2)
]

// 15

#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 307, end: 308), h1-level: 2)

#goal-timeline(
  items: goals_data.at("15"),
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true
)

#goal-results(
  primaryColor: primaryColor,
  accentColor: accentColor
)[
#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 314, end: 325), h1-level: 2)
]

// 16

#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 329, end: 330), h1-level: 2)

#goal-timeline(
  items: goals_data.at("16"),
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true
)

#goal-results(
  primaryColor: primaryColor,
  accentColor: accentColor
)[
#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 335, end: 359), h1-level: 2)
]

// 17

#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 361, end: 362), h1-level: 2)

#goal-timeline(
  items: goals_data.at("17"),
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true
)

#goal-results(
  primaryColor: primaryColor,
  accentColor: accentColor
)[
#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 368, end: 383), h1-level: 2)
]

// 18

#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 386, end: 387), h1-level: 2)

#goal-timeline(
  items: goals_data.at("18"),
  primaryColor: primaryColor,
  accentColor: accentColor,
  english: true
)

#goal-results(
  primaryColor: primaryColor,
  accentColor: accentColor
)[
#cmarker.render(read_file_lines("./src/en/mvp/tikslai-padaliniuose.md", start: 393, end: 402), h1-level: 2)
]

#pagebreak()

#section-page(
  title: "Strong Organization",
  bg-image: "../src/public/img/gallery/VU SA 24-25-02.jpg",
  primaryColor: primaryColor,
  accentColor: accentColor,
)

#cmarker.render(read_file_lines("./src/en/stipri-organizacija/tyrimai.md", start: 0), h1-level: 2)

#cmarker.render(read_file_lines("./src/en/stipri-organizacija/projektai.md", start: 0), h1-level: 2)

// SIC

#cmarker.render(read_file_lines("./src/en/stipri-organizacija/procesu-atnaujinimas.md", start: 0, end: 111), h1-level: 2)

#two-columns(
  left: [
  #styled-image(
    "../src/public/img/other/sic.jpg",
    width: 100%,
    primaryColor: primaryColor,
  )
],
  right: [
  #cmarker.render(read_file_lines("./src/en/stipri-organizacija/procesu-atnaujinimas.md", start: 111, end: 122), h1-level: 2)
],
  ratio: (1, 1)
)

#two-columns(
  left: [
  #styled-image(
    "../src/public/img/other/sic-1.jpg",
    width: 100%,
    primaryColor: primaryColor,
  )
],
  right: [
  #cmarker.render(read_file_lines("./src/en/stipri-organizacija/procesu-atnaujinimas.md", start: 125, end: 129), h1-level: 2)
],
  ratio: (1, 1)
)

#cmarker.render(read_file_lines("./src/en/stipri-organizacija/procesu-atnaujinimas.md", start: 131, end: 139), h1-level: 2)

#styled-image(
    "../src/public/img/other/sic-2.jpg",
    caption: "Iniciatyvų diena VU Šiaulių akademijoje",
    width: 100%,
    primaryColor: primaryColor,
  )

#cmarker.render(read_file_lines("./src/en/stipri-organizacija/procesu-atnaujinimas.md", start: 143, end: 153), h1-level: 2)

#styled-image(
    "../src/public/img/other/sic-3.jpg",
    caption: "HackVU '25",
    width: 100%,
    primaryColor: primaryColor,
  )

#cmarker.render(read_file_lines("./src/en/stipri-organizacija/procesu-atnaujinimas.md", start: 157), h1-level: 2)

/// END SIC

#cmarker.render(read_file_lines("./src/en/stipri-organizacija/isf.md", start: 0), h1-level: 2)

#pagebreak()

#section-page(
  title: "Sustainable University Community",
  bg-image: "../src/public/img/gallery/VU SA 24-25-05.jpg",
  primaryColor: primaryColor,
  accentColor: accentColor,
)

== Student initiatives

#cmarker.render(read_file_lines("./src/en/darni-bendruomene/iniciatyvos.md", start: 17, end: 18), h1-level: 2)

// JEK

#two-columns(
  left: [
  #image(
    "src/public/img/logos/JEK.jpg",
  )
],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "jek1"), h1-level: 2)
],
  ratio: (1, 2)
)

#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "jek2"), h1-level: 2)

=== Start FM

#two-columns(
  left: [
  #image(
    "src/public/img/logos/Start_FM.png",
  )
],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "startfm1"), h1-level: 2)
],
  ratio: (1, 2)
)

#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "startfm2"), h1-level: 2)

=== VU Kendo Club

#two-columns(
  left: [
  #image(
    "src/public/img/logos/Kendo Klubas.jpg",
  )
],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "kendo1"), h1-level: 2)
],
  ratio: (1, 2)
)

#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "kendo2"), h1-level: 2)

=== VU Career Days

#two-columns(
  left: [
  #image(
    "src/public/img/logos/Karjeros Dienos.png",
  )
],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "kd1"), h1-level: 2)
],
  ratio: (1, 1)
)

#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "kd2"), h1-level: 2)

=== VU Debate Club

#two-columns(
  left: [
  #image(
    "src/public/img/logos/Debatu Klubas.png",
  )
],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "debatuklubas1"), h1-level: 2)
],
  ratio: (1, 3)
)

=== Be etikečių

#two-columns(
  left: [
  #image(
    "src/public/img/logos/Be Etikeciu.png",
  )
],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "beetikeciu1"), h1-level: 2)
],
  ratio: (1, 3)
)

#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "beetikeciu2"), h1-level: 2)

=== VU Student Investment Fund

#two-columns(
  left: [
  #image(
    "src/public/img/logos/Studentu Investicinis Fondas.jpg",
  )
],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "sif1"), h1-level: 2)
],
  ratio: (1, 2)
)

#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "sif2"), h1-level: 2)

=== ESN Vilnius University

#two-columns(
  left: [
  #image(
    "src/public/img/logos/ESN.png",
  )
],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "esn1"), h1-level: 2)
],
  ratio: (1, 2)
)

#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "esn2"), h1-level: 2)

=== VU Law Clinic

#two-columns(
  left: [
  #image(
    "src/public/img/logos/Teises Klinika.png",
  )
],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "vutk1"), h1-level: 2)
],
  ratio: (1, 2)
)

#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "vutk2"), h1-level: 2)

=== The Coins Conference

#two-columns(
  left: [
  #image(
    "src/public/img/logos/The COINS.png",
  )
],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "thecoins1"), h1-level: 2)
],
  ratio: (1, 3)
)

#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "thecoins2"), h1-level: 2)

=== Young Journalists' Association

#two-columns(
  left: [
  #image(
    "src/public/img/logos/Jaunuju Zurnalistu Draugija.jpg",
  )
],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "jzk1"), h1-level: 2)
],
  ratio: (1, 3)
)

#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "jzk2"), h1-level: 2)

=== Alber aus VU HEMA Club

#two-columns(
  left: [
    #image(
      "src/public/img/logos/HEMA.jpg",
    )
  ],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "hema1"), h1-level: 2)
  ],
  ratio: (1, 3)
)
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "hema2"), h1-level: 2)

=== Sustainability Ambassadors Network

#two-columns(
  left: [
    #image(
      "src/public/img/logos/Tvarumo Ambasadoriu Tinklas.svg",
    )
  ],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "tat1"), h1-level: 2)
  ],
  ratio: (1, 3)
)
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "tat2"), h1-level: 2)

=== Students for pupils, pupils for students (SMMS)

#two-columns(
  left: [
    #image(
      "src/public/img/logos/SMMS.png",
    )
  ],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "smms1"), h1-level: 2)
  ],
  ratio: (1, 3)
)
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "smms2"), h1-level: 2)

=== Writers' Club

#two-columns(
  left: [
    #image(
      "src/public/img/logos/Rasytoju Klubas.jpg",
    )
  ],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "rk1"), h1-level: 2)
  ],
  ratio: (1, 3)
)
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "rk2"), h1-level: 2)

=== Ukrainian Youth Group in Lithuania

#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "uygl"), h1-level: 2)

=== Fotoklubas
#two-columns(
  left: [
    #image(
      "src/public/img/logos/Fotoklubas.png",
    )
  ],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "foto1"), h1-level: 2)
  ],
  ratio: (1, 3)
)
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "foto2"), h1-level: 2)

=== Kauliukas

#two-columns(
  left: [
    #image(
      "src/public/img/logos/Kauliukas.jpg",
    )
  ],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "kauliukas1"), h1-level: 2)
  ],
  ratio: (1, 3)
)
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "kauliukas2"), h1-level: 2)

=== Club „Artì"

#two-columns(
  left: [
    #image(
      "src/public/img/logos/Arti.jpg",
    )
  ],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "arti1"), h1-level: 2)
  ],
  ratio: (1, 3)
)
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "arti2"), h1-level: 2)

=== (Un)discovered Asia

#two-columns(
  left: [
    #image(
      "src/public/img/logos/Undiscovered asia.jpg",
    )
  ],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "uasia1"), h1-level: 2)
  ],
  ratio: (1, 3)
)
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "uasia2"), h1-level: 2)

=== SPPK

#two-columns(
  left: [
    #image(
      "src/public/img/logos/SPPK.png",
    )
  ],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "sppk1"), h1-level: 2)
  ],
  ratio: (1, 3)
)
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "sppk2"), h1-level: 2)

#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "konsultavimas1"), h1-level: 2)

=== Crochet Club

#two-columns(
  left: [
    #image(
      "src/public/img/logos/Nerimo Klubas.jpg",
    )
  ],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "nerimas1"), h1-level: 2)
  ],
  ratio: (1, 3)
)

=== Aurora Basket

#two-columns(
  left: [
    #image(
      "src/public/img/logos/Aurora Basket.jpg",
    )
  ],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "aurora"), h1-level: 2)
  ],
  ratio: (1, 3)
)

=== Astronomy Club
#two-columns(
  left: [
    #image(
      "src/public/img/logos/Astronomu Klubas.jpg",
    )
  ],
  right: [
#cmarker.render(read_file_section("./src/en/darni-bendruomene/iniciatyvos.md", section_id: "astr"), h1-level: 2)
  ],
  ratio: (1, 3)
)

#pagebreak()

#cmarker.render(read_file_lines("./src/en/darni-bendruomene/integracija.md"), h1-level: 2)

#cmarker.render(read_file_lines("./src/en/darni-bendruomene/renginiai.md"), h1-level: 2)

// --- Organizacijos nariai ---
#section-page(
  title: "Thank you for being with us!",
  bg-image: "../src/public/img/gallery/VU SA 24-25-16.jpg",
  primaryColor: primaryColor,
  accentColor: accentColor,
)

#let atstovai = get-persons-by-role(padaliniai_data, "Atstovų koordinator")

#let akademiniai = get-persons-by-role(padaliniai_data, "Akademinio proceso")
#let socialiniai = get-persons-by-role(padaliniai_data, "Socialinio proceso")

#let komunikacija = get-persons-by-role(padaliniai_data, "Komunikacijos")

== Central Office

#team-section(
  photo: "../src/public/img/dariniai/CB.jpg",
  members: get-persons-by-column(dariniai_data, "Darinys", "Centrinis biuras"),
  columns: 2,
  primaryColor: primaryColor,
  accentColor: accentColor,
  showTitle: true,
  showPadalinys: false
)

#pagebreak()

== Student Initiatives Center

#team-section(
  photo: "../src/public/img/dariniai/SIC.jpg",
  members: get-persons-by-column(dariniai_data, "Darinys", "VU SA Studentų iniciatyvų centras"),
  columns: 2,
  primaryColor: primaryColor,
  accentColor: accentColor,
  showTitle: true,
  showPadalinys: false
)

#pagebreak()

== Representatives coordinators

#team-section(
  photo: "../src/public/img/dariniai/Atstovai.jpg",
  members: atstovai,
  columns: 2,
  primaryColor: primaryColor,
  accentColor: accentColor,
  showTitle: false,
)

#pagebreak()

== Coordinators of Academic Process

#team-section(
  photo: "../src/public/img/dariniai/Akad.jpg",
  members: akademiniai,
  columns: 2,
  primaryColor: primaryColor,
  accentColor: accentColor,
  showTitle: false,
)

#pagebreak()

== Coordinators of Social Process

#team-section(
  photo: "../src/public/img/dariniai/Soc.jpg",
  members: socialiniai,
  columns: 2,
  primaryColor: primaryColor,
  accentColor: accentColor,
  showTitle: false,
)

#pagebreak()

== Coordinators of Communication

#team-section(
  photo: "../src/public/img/dariniai/Kom.jpg",
  members: komunikacija,
  columns: 2,
  primaryColor: primaryColor,
  accentColor: accentColor,
  showTitle: false,
)

#pagebreak()

== Coordinators of Marketing

#let marketingas = get-persons-by-role(padaliniai_data, "Marketingo")

#team-section(
  photo: "../src/public/img/dariniai/Mark.jpg",
  members: marketingas,
  columns: 3,
  primaryColor: primaryColor,
  accentColor: accentColor,
  showTitle: false,
)

#pagebreak()

== Coordinators of Organizational Affairs

#let org = get-persons-by-role(padaliniai_data, "Organizacinės srities")

#team-section(
  photo: "../src/public/img/dariniai/Org.jpg",
  members: org,
  columns: 2,
  primaryColor: primaryColor,
  accentColor: accentColor,
  showPadalinys: true,
  showTitle: false
)

#pagebreak()

== Human Resources Coordinators

#let hr = get-persons-by-role(padaliniai_data, "Žmogiškųjų išteklių")

#team-section(
  photo: "../src/public/img/dariniai/HR.jpg",
  members: hr,
  columns: 2,
  primaryColor: primaryColor,
  accentColor: accentColor,
  showPadalinys: true,
  showTitle: false
)

#pagebreak()

== Coordinators of Integration Process

#let integracija = get-persons-by-role(padaliniai_data, "Integracijos proceso")

#team-section(
  photo: "../src/public/img/dariniai/Integr.jpg",
  members: integracija,
  columns: 2,
  primaryColor: primaryColor,
  accentColor: accentColor,
  showPadalinys: true,
  showTitle: false
)

#pagebreak()

== Coordinators of International Students Affairs

#let tarptautiniai = get-persons-by-role(padaliniai_data, "Tarptautinių")

#team-section(
  photo: "../src/public/img/dariniai/ISAC.jpg",
  members: tarptautiniai,
  columns: 2,
  primaryColor: primaryColor,
  accentColor: accentColor,
  showPadalinys: true,
  showTitle: false
)

#pagebreak()

== Administrators

#let admin = get-persons-by-role(padaliniai_data, "Administrator")

#team-section(
  photo: "../src/public/img/dariniai/Admin.jpg",
  members: admin,
  columns: 2,
  primaryColor: primaryColor,
  accentColor: accentColor,
  showPadalinys: true,
  showTitle: false
)

#pagebreak()

== Managers of Initiatives

#team-section(
  photo: "../src/public/img/dariniai/PKP vadovai.jpg",
  members: get-persons-by-column(padaliniai_data, "Padalinys", "Iniciatyvos"),
  columns: 2,
  primaryColor: primaryColor,
  accentColor: accentColor,
  showTitle: true,
  showPadalinys: false
)

#pagebreak()

== Friends

#let friendLogos = json("src/data/friendLogos.json").friendLogos

#v(2em)

#grid(
  columns: 4,
  gutter: 2em,
  ..friendLogos.map(logo => {
    align(center)[#image(
      "src/public" + logo,
      fit: "contain"
    )]
  })
)

#v(2em)

== Acknowledgements

#block(
  inset: (left: 1em),
  width: 100%,
)[
#cmarker.render(read_file_lines("./src/en/padeka.md", start: 18), h1-level: 2)
]

#pagebreak()

// --- End of main content ---
#end-page(
  thanks-text: "United for the Future of Students!",
  logo: "../src/public/img/logos/vusa-lt-w.png",
  primaryColor: primaryColor,
  accentColor: accentColor,
)

// Team Avatars Component for VU SA Annual Report
// This component displays a grid of team members with their avatars and information
// Similar to the Vue TeamAvatarLayout component

#let team-avatar(
  // Required parameters
  person,
  // Design parameters
  primaryColor: rgb("#1A1A1A"),
  accentColor: rgb("#fbad13"),
  avatarSize: "normal",
  showTitle: true,
  showPadalinys: true,
) = {
  // Define avatar sizes
  let avatar-dimensions = (
    "tiny": 1.5em,
    "small": 2.0em,
    "normal": 2.5em,
  )
  
  let size = avatar-dimensions.at(avatarSize, default: avatar-dimensions.normal)
  
  // Create the avatar with information layout
  block(
    width: 100%,
    inset: 0.5em,
    fill: white,
    radius: 4pt,
  )[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 0.6em,

      // Avatar image or fallback
      align(center + horizon)[
        #if person.avatar != none [
          // For images, place inside a circle clip
          #box(
            width: size,
            height: size,
            clip: true,
            radius: 50%,
            stroke: none,
            [#image(person.avatar, width: size, height: size, fit: "cover")]
          )
        ] else [
          #circle(
            radius: size / 2, 
            stroke: none, 
            fill: accentColor.lighten(70%)
          )[
            #align(center + horizon)[
              #text(
                primaryColor.darken(20%),
                weight: "bold",
                size: size * 0.4,
              )[#person.name.split(" ").map(word => word.at(0)).join("")]
            ]
          ]
        ]
      ],
      
      // Person information
    align(horizon)[
        #set par(spacing: 0.5em)
        #text(weight: "bold", size: 01em)[#person.name]
        
        #if showPadalinys and person.padalinys != none [
          #text(
            size: 0.75em,
            weight: "regular",
            fill: primaryColor.lighten(30%),
          )[#person.padalinys]
        ]
        
        #if showTitle and person.title != none [
          #text(
            size: 0.8em,
          )[#person.title]
        ]
        #set par(spacing: 0.8em) 
        
        #if person.fullTerm == false and person.period != none [
          #text(
            size: 0.8em,
            style: "italic",
            fill: primaryColor.lighten(50%),
          )[#person.period]
        ]
      ]
    )
  ]
}

#let team-avatars-grid(
  // Required parameter
  members,
  // Optional parameters
  columns: 2,
  primaryColor: rgb("#1A1A1A"),
  accentColor: rgb("#fbad13"),
  avatarSize: "normal",
  showTitle: true,
  showPadalinys: true,
  sortByPadalinys: true,
) = {
  // Sort members if requested
  let sorted-members = members
  if sortByPadalinys {
    sorted-members = members.sorted(key: member => {
      if member.padalinys != none {
        return member.padalinys
      } else {
        return "zzz" // Sort members without padalinys last
      }
    })
  }
  
  // Create grid of members
  grid(
    columns: (1fr,) * calc.min(columns, sorted-members.len()),
    column-gutter: 0.8em,
    row-gutter: 0.4em,
    
    ..sorted-members.map(member => {
      team-avatar(
        member,
        primaryColor: primaryColor,
        accentColor: accentColor,
        avatarSize: avatarSize,
        showTitle: showTitle,
        showPadalinys: showPadalinys,
      )
    })
  )
}

// Function to filter members from JSON data
#let filter-members(
  data,
  roleFilter: none,
  padalinysFilter: none,
) = {
  let filtered = data
  
  // Filter by role if provided
  if roleFilter != none {
    // Handle both string and array of strings
    let roles = if type(roleFilter) == "array" { roleFilter } else { (roleFilter,) }
    
    filtered = filtered.filter(person => {
      if "role" not in person { return false }
      
      // Check if any of the roles match the person's role
      for role in roles {
        if person.role.contains(role) { return true }
      }
      return false
    })
  }
  
  // Filter by padalinys if provided
  if padalinysFilter != none {
    filtered = filtered.filter(person => {
      if "padalinys" not in person { return false }
      return person.padalinys == padalinysFilter
    })
  }
  
  return filtered
}

// Component that combines a section with photo and team avatars
#let team-section(
  // Content parameters
  title: none,
  description: none,
  members: (),  // Array of member objects
  
  // Design parameters
  photo: none,
  photoCaption: none,
  primaryColor: rgb("#1A1A1A"),
  accentColor: rgb("#fbad13"),
  columns: 2,
  avatarSize: "normal",
  showTitle: true,
  showPadalinys: true,
  sortByPadalinys: true,
) = {
  // Section title
  if title != none {
    heading(level: 2)[#title]
  }
  
  // Description
  if description != none {
    description
    v(1em)
  }
  
  // Photo if provided
  if photo != none {
    block(width: 100%, height: auto, inset: (y: 0.3em))[
      #image(photo, width: 100%)
      #if photoCaption != none [
        #align(center)[
          #text(
            size: 0.8em,
            style: "italic",
            fill: primaryColor.lighten(30%),
          )[#photoCaption]
        ]
      ]
    ]
  }
  
  // Team avatars
  team-avatars-grid(
    members,
    columns: columns,
    primaryColor: primaryColor,
    accentColor: accentColor,
    avatarSize: avatarSize,
    showTitle: showTitle,
    showPadalinys: showPadalinys,
    sortByPadalinys: sortByPadalinys,
  )
}

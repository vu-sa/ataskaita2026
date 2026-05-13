// CSV data processing component for team members
// Uses built-in csv function to process data from CSV files similar to personUtils.ts

// Load and parse CSV file with Typst's built-in csv function
#let load-csv(file-path) = {
  // Use native csv function with dictionary row type to map headers to values
  let data = csv(file-path, row-type: dictionary)
  
  // Return the parsed data
  return data
}

// Format image path
#let format-image-path(image-name, path-prefix: "../src/public/img/people/") = {
  if image-name == "" { return path-prefix + "placeholder.jpg" }
  
  // Trim any extra whitespace
  let clean-path = image-name.trim()
  
  // Handle case where the image already has a full path
  if clean-path.starts-with("/") {
    return "../src/public" + clean-path
  }

  // List of unexisting images
  let unexisting-images = (
    "rusne-sakinyte.jpg",
    "karina-kandrotaite.jpg",
    "Foto nėra",
    "Nėra foto",
    "haroldas.zaluda.jpg",
    "elze-audejyte.jpg",
  )

  if unexisting-images.contains(clean-path) {
    // Return none instead of a logo path to trigger the initials avatar
    return none
  }
  
  // Let's create a placeholder path for now since we don't have actual images in the demo
  // In a real project, we'd use: path-prefix + clean-path
  return path-prefix + clean-path
}

// Filter team members by role
#let filter-by-role(data, role-pattern) = {
  let role-patterns = if type(role-pattern) == array { role-pattern } else { (role-pattern,) }
  
  return data.filter(person => {
    if person.Pareigos == none { return false }
    let roles = person.Pareigos.split("\n")
    
    for pattern in role-patterns {
      for role in roles {
        // Simple contains check
        if role.trim().contains(pattern) {
          return true
        }
      }
    }
    
    return false
  })
}

// Filter team members by column value
#let filter-by-column(data, column-name, value) = {
  let values = if type(value) == array { value } else { (value,) }
  
  return data.filter(person => {
    if person.at(column-name, default: "") == "" { return false }
    
    let field-values = person.at(column-name).split("\n")
    
    for field-value in field-values {
      for v in values {
        if field-value.trim().contains(v) {
          return true
        }
      }
    }
    
    return false
  })
}

// Convert CSV data to team member objects
#let to-team-members(data) = {
  return data.map(person => {
    let roles = person.Pareigos.split("\n")
    let first-role = roles.at(0, default: "")
    
    return (
      name: person.at("Vardas Pavardė", default: ""),
      title: first-role,
      role: person.at("Pareigos", default: ""),
      avatar: format-image-path(person.at("Nuotraukos pavadinimas", default: "")),
      period: person.at("Laikotarpis", default: ""),
      fullTerm: person.at("Ar išbuvo pilną kadenciją?", default: "") == "Taip",
      padalinys: person.at("Padalinys", default: "")
    )
  })
}

// Get team members by role
#let get-persons-by-role(data, role-pattern) = {
  let filtered = filter-by-role(data, role-pattern)
  return to-team-members(filtered)
}

// Get team members by column value
#let get-persons-by-column(data, column-name, value) = {
  let filtered = filter-by-column(data, column-name, value)
  return to-team-members(filtered)
}

// Count members by unit 
#let count-by-unit(data) = {
  let counts = (:)
  
  for person in data {
    let unit = person.Padalinys
    if unit == none { continue }
    
    if unit in counts {
      counts.at(unit) += 1
    } else {
      counts.insert(unit, 1)
    }
  }
  
  return counts
}

// Get unit statistics summary
#let get-unit-stats(data) = {
  let counts = count-by-unit(data)
  let units = counts.keys()
  let total = 0
  
  for unit in units {
    total += counts.at(unit)
  }
  
  return (
    units: units,
    counts: counts,
    total: total,
    unit_count: units.len()
  )
}

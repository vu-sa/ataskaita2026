#let styled-image(
  path,
  caption: none,
  width: 100%,
  primaryColor: rgb("#fbad13"), // This color might be used for a subtle accent if needed
) = {
  figure(
    box(
      width: 100%,
      inset: 0.2em, // Slightly reduced inset for a tighter border
      stroke: (
        thickness: 1.5pt, // Thinner stroke
        paint: gradient.linear(
          angle: 90deg,
          primaryColor.lighten(10%), // Darker start/end for more definition
          primaryColor.lighten(40%), // Lighter middle
          primaryColor.lighten(10%)
        )
      ),
      radius: 3pt, // Slightly larger radius for a softer look
      clip: true,
      image(path, width: width)
    ),
    caption: if caption != none [
      // Caption styling will be inherited from the `show figure` rule in layout.typ
      // for consistency. We just pass the caption content.
      #caption
    ],
    supplement: none // Explicitly keeping supplement as none, as is good practice
  )
}

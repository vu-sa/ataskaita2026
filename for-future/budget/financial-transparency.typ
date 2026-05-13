#import "../layout.typ": two-columns
#import "budget-visualization.typ": budget-visualization
#import "comparison-chart.typ": comparison-chart
#import "pull-quote.typ": pull-quote

#let financial-transparency(primaryColor: rgb("#fbad13"), accentColor: rgb("#b5333e")) = {
  let budget = json("../data/budget-data.json")
  let progress = json("../data/progress-data.json")
  
  [
    
    #v(1.5em)
    
    #budget-visualization(
      categories: budget.categories,
      amounts: budget.amounts,
      total: budget.total,
      primaryColor: primaryColor,
      accentColor: accentColor,
    )
    
    #v(2em)
    
    #heading(level: 2, "Metinė kaita")
    
    #v(1em)
    
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 1.5em,
      
      ..progress.comparisons.map(comparison => {
        comparison-chart(
          title: comparison.title,
          before-value: comparison.before-value,
          after-value: comparison.after-value,
          before-label: comparison.before-label,
          after-label: comparison.after-label,
          increase-is-good: true,
          primaryColor: primaryColor,
          accentColor: accentColor,
        )
      })
    )
    
    #v(2em)
    
    #heading(level: 2, "Finansavimo šaltiniai")
    
    #v(1em)
    
    #two-columns(
      left: [
        #align(center)[
          #pie(
            radius: 5em,
            slices: (
              (60, primaryColor),
              (25, accentColor),
              (10, primaryColor.lighten(20%)),
              (5, accentColor.lighten(20%)),
            )
          )
        ]
      ],
      right: [
        #block(
          inset: (left: 1em),
        )[
          #table(
            columns: (auto, 1fr),
            inset: (x: 0.8em, y: 0.5em),
            align: (left, left),
            stroke: none,
            
            box(width: 1em, height: 1em, fill: primaryColor), [*Universiteto parama* (60%)],
            box(width: 1em, height: 1em, fill: accentColor), [*Projektinis finansavimas* (25%)],
            box(width: 1em, height: 1em, fill: primaryColor.lighten(20%)), [*Rėmėjų lėšos* (10%)],
            box(width: 1em, height: 1em, fill: accentColor.lighten(20%)), [*Kiti šaltiniai* (5%)],
          )
          
          #v(1em)
          
          
        ]
      ],
      ratio: (1, 1)
    )
    
    #v(2em)
    
    #heading(level: 2, "Finansinių tikslų įgyvendinimas")
    
    #v(1em)
    
    #block(
      width: 100%,
      fill: white,
      stroke: (paint: primaryColor.lighten(70%)),
      radius: 4pt,
      inset: (x: 1.5em, y: 1em),
    )[
      #set par(justify: true)
      
      #list(
        indent: 1em,
        [Projektinis finansavimas padidėjo 12% lyginant su praėjusiais metais],
        [Administracinės išlaidos sumažėjo 5% dėl efektyvesnių procesų],
        [Studentų atstovavimui skirta 30% daugiau lėšų nei praėjusiais metais],
        [Pritraukta 15 naujų rėmėjų, kurių bendra parama siekė 27,560 €]
      )
      
      #v(1em)
      
      Ateities finansiniuose planuose numatoma toliau didinti projektinį finansavimą, stiprinti bendradarbiavimą su rėmėjais ir ieškoti naujų finansavimo šaltinių.
    ]
  ]
}

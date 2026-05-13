#import "layout.typ": two-columns
#import "feature-box.typ": feature-box
#import "goal-progress.typ": goal-progress
#import "pull-quote.typ": pull-quote

#let sustainability-section(primaryColor: rgb("#fbad13"), accentColor: rgb("#b5333e")) = {
  let data = json("../data/sustainability-data.json")
  
  [
    VU SA, remdamasi atsakomybės vertybe, inicijavo ir prisidėjo prie įvairių darnaus vystymosi projektų universitete, siekiant kurti tvaresnę ir labiau tausojančią aplinką.
    
    #v(1.5em)
    
    #heading(level: 2, "Darnaus vystymosi iniciatyvos")
    
    #v(1em)
    
    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 1em,
      row-gutter: 1em,
      
      ..data.initiatives.map(initiative => {
        feature-box(
          title: initiative.title,
          content: [
            #initiative.description
            
            #v(0.8em)
            
            #block(
              fill: rgb("#22c55e").lighten(90%),
              radius: 2pt,
              inset: (x: 0.8em, y: 0.4em),
              stroke: (left: 2pt + rgb("#22c55e")),
            )[
              #text(weight: "bold", size: 0.9em)[Poveikis: #initiative.impact]
            ]
          ],
          primaryColor: primaryColor,
          accentColor: accentColor,
        )
      })
    )
    
    #v(2em)
    
    #heading(level: 2, "Darnaus vystymosi tikslų įgyvendinimas")
    
    #v(1em)
    
    #two-columns(
      left: [
        #for goal in data.goals [
          #goal-progress(
            title: goal.title,
            current: goal.current,
            target: goal.target,
            primaryColor: rgb("#22c55e"),
            accentColor: accentColor,
          )
          
          #v(1em)
        ]
      ],
      right: [
        #block(
          fill: white,
          radius: 3pt,
          stroke: (paint: rgb("#22c55e").lighten(60%)),
          inset: 1em,
        )[
          #text(weight: "bold")[Darnaus vystymosi partneriai:]
          
          #v(0.8em)
          
          #for partner in data.partners [
            - #partner
          ]
          
          #v(1em)
          
          #align(center)[
            #image("../src/public/img/logos/vusa-en-b.png", width: 80%)
          ]
        ]
      ],
      ratio: (1, 1)
    )
    
    #v(2em)
    
    #heading(level: 2, "Komanda ir vizija")
    
    #v(1em)
    
    #two-columns(
      left: [
        #figure(
          "../src/public/img/gallery/VU SA 24-25-14.jpg",
          caption: "Darnaus vystymosi komanda",
          // primaryColor: primaryColor,
        )
      ],
      right: [
        #pull-quote(
          quote-text: data.quote.text,
          author: data.quote.author,
          primaryColor: rgb("#22c55e"),
          accentColor: accentColor,
        )
      ],
      ratio: (1, 1)
    )
    
    #v(2em)
    
    #heading(level: 2, "Ateities darnaus vystymosi kryptys")
    
    #v(1em)
    
    #block(
      width: 100%,
      fill: white,
      stroke: (paint: primaryColor.lighten(70%)),
      radius: 4pt,
      inset: (x: 1.5em, y: 1em),
    )[
      #set par(justify: true)
      
      VU SA numato toliau stiprinti darnaus vystymosi kryptį ir plėtoti šias iniciatyvas:
      
      #list(
        indent: 1em,
        [Tvarios praktikos integravimas į visas organizacines veiklas ir procesus],
        [Darnaus vystymosi mokymų programos sukūrimas studentams ir VU SA nariams],
        [Bendradarbiavimo su tarptautinėmis organizacijomis plėtra, siekiant perimti geriausias praktikas],
        [Žaliosios universiteto infrastruktūros tobulinimo skatinimas]
      )
      
      #v(0.8em)
      
      Šios strateginės kryptys padės kurti tvaresnį universitetą ir ugdyti socialiai atsakingus absolventus.
    ]
  ]
}

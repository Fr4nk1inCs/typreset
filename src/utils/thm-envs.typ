/**
 * The main idea of this manually managed theorem counter comes from
 * typst-theorems repository by Satvik Saha (https://github.com/sahasatvik).
 * See https://github.com/sahasatvik/typst-theorems for more details.
 */

// Theorem Environment numbering
#let thm-counters = state("thm",
  (
    "counters": ("heading": ()),
    "latest": (),
  )
)

#let thm-base(type: str, color: color) = {
  (numbered: true, name: none, body) => {
    let number = ""
    let result = none
    if numbered {
      // Managing counters, using code in 
      // https://github.com/sahasatvik/typst-theorems/blob/main/theorems.typ
      result = locate(
        loc => {
          return thm-counters.update(
            thm-pair => {
              let counters = thm-pair.at("counters")
              // Manually update heading counter
              counters.at("heading") = counter(heading).at(loc).first()
              if not type in counters.keys() {
                counters.insert(type, (0, ))
              }

              let thm-counter = counters.at(type)
              let heading-counter = counters.at("heading")

              // Reset counter if the base counter has updated
              if thm-counter.at(0) == heading-counter {
                counters.at(type) = (heading-counter, thm-counter.last() + 1)
              } else {
                counters.at(type) = (heading-counter, 1)
              }

              let latest = counters.at(type)
              return (
                "counters": counters,
                "latest": latest
              )
            }
          )
        }
      )

      number = thm-counters.display(x => {
        return numbering("1.1.", ..x.at("latest"))
      })
    }

    let name-content = none
    if name != none {
      name-content = "(" + name + ")"
    } else {
      name-content = ""
    }

    let title-content = text(fill: white, weight: "bold", type + " " + number + " " + name-content + " ")
    let title-background = style(
      styles => {
        let title-size = measure(title-content, styles)
        let title-height = title-size.height + 10pt
        let title-width = title-size.width + 6pt

        return stack(
          dir: ltr,
          rect(
            width: title-width,
            height: title-height,
            fill: color,
            radius: (top-left: 3pt),
            stroke: color,
          ),
          polygon(
            fill: color,
            stroke: color,
            (0pt, 0pt),
            (0pt, title-height),
            (title-height * 0.2, 0pt)
          )
        )
      }
    )
    

    return figure(
      result + 
      rect(
        width: 100%,
        fill: color.lighten(90%),
        radius: 3pt,
        stroke: color,
      )[
        #set align(left)
        #place(alignment.left + alignment.top, dx: -5pt, dy: -5pt, title-background)
        #title-content
        #emph(body)
      ],
      caption: none,
      outlined: false,
      kind: "thm-env",
      supplement: type,
      numbering: (..numbers) => { return number },
    )
  }
}

// Presets
#let theorem = thm-base(
  type: "Theorem",
  color: blue,
)

#let definition = thm-base(
  type: "Definition",
  color: orange,
)

#let lemma = thm-base(
  type: "Lemma",
  color: purple,
)

#let corollary = thm-base(
  type: "Corollary",
  color: green,
)

// Proof environment
#let proof(body) = block(spacing: 11.5pt, {
  emph[Proof.]
  [ ] + body
  h(1fr)
  box(scale(160%, origin: bottom + right, sym.square.stroked))
})

#let presets() = {
  (
    theorem,
    definition,
    lemma,
    corollary,
    proof
  )
}
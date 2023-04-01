#let note(title: "Note title", author: "Name", logo: none, date: none,
          preface: none, code_with_line_number: true, body) = {
  // Set the document's basic properties.
  set document(author: (author, ), title: title)
  set page(
    numbering: "1",
    number-align: end,
    // Running header.
    header-ascent: 14pt,
    header: locate(loc => {
      let i = counter(page).at(loc).first()
      if i == 1 { return }
      set text(size: 8pt)
      if calc.odd(i) { align(end, title) } else { align(start, title) }
    }),
  )
  set text(font: "New Computer Modern", lang: "en")
  show math.equation: set text(font: "New Computer Modern Math", weight: 400)

  // Set paragraph spacing.
  show par: set block(above: 1.2em, below: 1.2em)

  set par(leading: 0.75em)

  // Title page.
  // The page can contain a logo if you pass one with `logo: "logo.png"`.
  v(0.6fr)
  if logo != none {
    align(right, image(logo, width: 26%))
  }
  v(9.6fr)

  text(1.1em, date)
  v(1.2em, weak: true)
  text(2em, weight: 700, title)

  // Author information.
  pad(
    top: 0.7em,
    right: 20%,
    align(start, author)
  )

  v(2.4fr)
  pagebreak()

  [
    = Preface
  ]

  preface
  pagebreak()

  // Table of contents
  [
    = Contents
  ]

  outline(title: none, depth: 3, indent: true)
  pagebreak()

  // Main body
  set par(justify: true)

  set heading(numbering: "1.")

  // Code
  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )

  show raw.where(block: true): block.with(
    width: 100%,
    fill: luma(240),
    inset: 10pt,
    radius: 4pt,
  )

  // Code block with line numbers
  show raw.where(block: true): it => {
    if not code_with_line_number { return it }
    let lines = it.text.split("\n")
    let length = lines.len()
    let i = 0
    let left_str = while i < length {
      i = i + 1
      str(i) + "\n"
    }
    grid(
      columns: (auto, 1fr),
      align(
        right,
        block(
          inset: (
            top: 10pt,
            bottom: 0pt,
            left: 0pt,
            right: 5pt
          ),
          left_str
        )
      ),
      align(left, it),
    )
  }

  body
}

// Theorem and definition environments.

#let base_env(type: "Theorem", name: none, numbered: true, fg: black, bg: white,
          body) = locate(
    location => {
      let lvl = counter(heading).at(location)
      let i = counter(type).at(location).first()
      let top = if lvl.len() > 0 { lvl.first() } else { 0 }
      show: block.with(spacing: 11.5pt)
      stack(
        dir: ttb,
        rect(fill: fg, radius: (top-right: 5pt), stroke: fg)[
          #strong(
            text(white)[
              #type
              #if numbered {
                counter(type).step()
                [ #top.#i.]
              }
              #if name != none [ (#name) ]
            ]
          )
        ],
        rect(width: 100%,
          fill: bg,
          radius: ( right: 5pt ),
          stroke: (
            left: fg,
            right: bg + 0pt,
            top: bg + 0pt,
            bottom: bg + 0pt,
          )
        )[
          #emph(body)
        ]
      )
    }
  )
)

#let theorem(body, name: none, numbered: true) = {
  base_env(
    type: "Theorem",
    name: name,
    numbered: numbered,
    fg: blue,
    bg: rgb("#e8e8f8"),
    body
  )
}

#let definition(body, name: none, numbered: true) = {
  base_env(
    type: "Definition",
    name: name,
    numbered: numbered,
    fg: orange,
    bg: rgb("#f8e8e8"),
    body
  )
}

#let lemma(body, name: none, numbered: true) = {
  base_env(
    type: "Lemma",
    name: name,
    numbered: numbered,
    fg: purple,
    bg: rgb("#efe6ff"),
    body
  )
}

#let corollary(body, name: none, numbered: true) = {
  base_env(
    type: "Corollary",
    name: name,
    numbered: numbered,
    fg: green,
    bg: rgb("#e8f8e8"),
    body
  )
}

// Proof environment
#let proof(body) = block(spacing: 11.5pt, {
  emph[Proof.]
  [ ] + body
  h(1fr)
  box(scale(160%, origin: bottom + right, sym.square.stroked))
})

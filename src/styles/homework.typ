#import "../general/font.typ": set-font

#let i18n-hw-lit = (
  "en": " Homework",
  "zh-cn": "作业",
)

#let style(course: "Course Name", number: 0, names: "Student Name", ids: "Student ID", lang: "en", body) = {
  let names = if type(names) == str { (names, ) } else { names }
  let ids = if type(ids) == str { (ids, ) } else { ids }


  assert(names.len() == ids.len(), message: "Number of names and IDs do not match")

  let hw-literal = i18n-hw-lit.at(lang)

  // style
  show: set-font.with(lang: lang)
  set par(linebreaks: "optimized", justify: true)

  // document
  let title = course + hw-literal + " " + str(number)
  let header = none
  if names.len() == 1 {
    let author-text = names.at(0) + " " + ids.at(0)
    header = locate(loc => {
      let page-index = counter(page).at(loc).first()
      if page-index == 1 { return }
      set text(size: 8pt)
      grid(
        columns: (auto, 1fr),
        align(left, title),
        align(right, text(author-text)),
      )
    })
  } else {
    header = locate(loc => {
      let page-index = counter(page).at(loc).first()
      if page-index == 1 { return }
      align(center, text(size: 8pt, title))
    })
  }

  set document(title: title, author: names)
  set page(
    numbering: "1",
    number-align: center,
    // Running header
    header-ascent: 14pt,
    header: header,
  )

  // title
  let title-ids = if lang.contains("zh") {
    ids.map(id => { v(0.2em) + id })
  } else {
    ids
  }
  align(center)[
    #strong(text(size: 1.75em, title))

    #grid(
      columns: 2,
      column-gutter: 1em,
      row-gutter: 0.4em,
      ..names.zip(title-ids).flatten()
    )
  ]

  body
}

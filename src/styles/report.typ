#import "../general/font.typ": set-font

#let i18n-report-lit = (
  "en": " Report",
  "zh-cn": "报告",
)

#let style(report-name: "Report Name", authors: "Student Name", lang: "en", body) = {
  let authors = if type(authors) == str { (authors, ) } else { authors }

  let report-lit = i18n-report-lit.at(lang)

  // heading
  show heading: strong

  // style
  show: set-font.with(lang: lang)
  set par(linebreaks: "optimized", justify: true)

  // document
  let title = report-name + report-lit
  let header = none
  if authors.len() == 1 {
    let author-text = authors.at(0)
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

  set document(title: title, author: authors)
  set page(
    numbering: "1",
    number-align: center,
    // Running header
    header-ascent: 14pt,
    header: header,
  )

  // title
  align(center)[
    #strong(text(size: 1.75em, title))

    #grid(
      columns: 1,
      row-gutter: 0.4em,
      ..authors.flatten()
    )
  ]

  body
}

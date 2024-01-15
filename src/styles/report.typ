#import "./basic.typ": base-style
#import "../utils/title.typ": make-title
#import "../utils/header.typ": make-header

#let style(report-name: "Report Name", authors: "Student Name", lang: "en", body) = {
  let authors = if type(authors) == str { (authors, ) } else { authors }

  let title = report-name

  show: base-style.with(lang: lang)
  set document(title: title, author: authors)

  let header = if authors.len() == 1 {
    grid(
      columns: (auto, 1fr),
      align(left, title),
      align(right, authors.at(0)),
    )
  } else {
    title
  }
  set page(
    header-ascent: 14pt,
    header: make-header(header),
  )

  // title
  make-title(
    title: title,
    other: grid(
      columns: 1,
      row-gutter: 0.4em,
      ..authors.flatten()
    )
  )

  body
}

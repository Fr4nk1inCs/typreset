#import "./basic.typ": base-style
#import "../utils/title.typ": make-title
#import "../utils/header.typ": make-header

#let i18n-hw-lit = (
  "en": " Homework",
  "zh-cn": "作业",
)

#let style(
  course: "Course Name",
  number: 0,
  names: "Student Name",
  ids: "Student ID",
  lang: "en",
  body,
) = {
  let names = if type(names) == str {
    (names,)
  } else {
    names
  }
  let ids = if type(ids) == str {
    (ids,)
  } else {
    ids
  }
  assert(
    names.len() == ids.len(),
    message: "Number of names and IDs do not match",
  )

  let hw-literal = i18n-hw-lit.at(lang)
  let title = course + hw-literal + " " + str(number)

  show: base-style.with(lang: lang)
  set document(title: title, author: names)

  // header
  let header = if names.len() == 1 {
    grid(
      columns: (auto, 1fr),
      align(left, title), align(right, names.at(0) + " " + ids.at(0)),
    )
  } else {
    text(title)
  }
  set page(
    header-ascent: 14pt,
    header: make-header(header),
  )

  // title
  make-title(
    title: title,
    other: grid(
      align: center + bottom,
      columns: 2,
      column-gutter: 1em,
      row-gutter: 0.4em,
      ..names.zip(ids).flatten()
    ),
  )

  body
}

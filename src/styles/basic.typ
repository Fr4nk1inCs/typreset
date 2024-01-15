#import "../utils/font.typ": set-font

#let base-style(lang: "en", body) = {
  // font
  show: set-font.with(lang: lang)
  // paragraph
  set par(linebreaks: "optimized", justify: true)
  // heading
  show heading: strong
  // page
  set page(
    numbering: "1",
    number-align: center,
  )
  body
}

#let make-header(body) = {
  context {
    let page-index = counter(page)
    if page-index == 1 {
      return
    }
    set text(size: 8pt)
    body
  }
}

#let make-header(body) = {
  locate(location => {
    let page-index = counter(page).at(location).first()
    if page-index == 1 { return }
    set text(size: 8pt)
    body
  })
}

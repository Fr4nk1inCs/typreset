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
  // FIX: fixes typst's list/enum rendering
  // See https://github.com/typst/typst/issues/1204 for more info
  show list.item: it => {
    // The generated terms is not tight
    // So setting `par.spacing` is to set the result lists' spacing
    let spacing = if list.spacing != auto {
      enum.spacing
    } else if enum.tight {
      par.leading
    } else {
      par.spacing
    }
    set par(spacing: spacing)

    let current-marker = if type(list.marker) == array {
      list.marker.at(0)
    } else {
      list.marker
    }

    context {
      let hanging-indent = measure(current-marker).width + terms
        .separator
        .amount
      set terms(hanging-indent: hanging-indent)
      if type(list.marker) == array {
        terms.item(
          current-marker,
          {
            // set the value of list.marker in a loop
            set list(marker: list.marker.slice(1) + (list.marker.at(0),))
            it.body
          },
        )
      } else {
        terms.item(current-marker, it.body)
      }
    }
  }


  let counting-symbols = "1aAiI一壹あいアイא가ㄱ*"
  let consume-regex = regex("[^" + counting-symbols + "]*[" + counting-symbols + "][^" + counting-symbols + "]*")

  show enum.item: it => {
    if it.number == none {
      return it
    }
    // The generated terms is not tight
    // So setting `par.spacing` is to set the result enums' spacing
    let spacing = if enum.spacing != auto {
      enum.spacing
    } else if enum.tight {
      par.leading
    } else {
      par.spacing
    }
    set par(spacing: spacing)


    let new-numbering = if type(enum.numbering) == function or enum.full {
      numbering.with(enum.numbering, it.number)
    } else {
      enum.numbering.trim(consume-regex, at: start, repeat: false)
    }
    let current-number = numbering(enum.numbering, it.number)
    context {
      let hanging-indent = measure(current-number).width + terms
        .separator
        .amount

      set terms(hanging-indent: hanging-indent)

      terms.item(
        strong(delta: -300, numbering(enum.numbering, it.number)),
        {
          if new-numbering != "" {
            set enum(numbering: new-numbering)
            it.body
          } else {
            it.body
          }
        },
      )
    }
  }
  body
}

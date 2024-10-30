/* Font settings for all presets */

#let base-font = "Libertinus Serif"

#let math-font = "Libertinus Math"

#let i18n-fonts = (
  "zh-cn": body => {
    show math.equation: set text(font: ("Libertinus Math", "FandolSong"))
    set text(font: (base-font, "FandolSong"), lang: "zh")
    show emph: set text(font: (base-font, "FandolKai"))

    body
  },
)

#let set-font(lang: "en", body) = {

  if lang == "en" {
    set text(font: base-font, lang: "en")
    show math.equation: set text(font: "Libertinus Math")
    body
  } else if lang in i18n-fonts.keys() {
    show: i18n-fonts.at(lang)
    body
  } else {
    assert(false, message: "Font for language " + lang + " not supported")
  }
}

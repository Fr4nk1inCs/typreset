/* Font settings for all presets */

#let base-font = "Linux Libertine"

#let math-font = "Libertinus Math"

#let i18n-fonts = (
  "zh": (
    "base": "FZShuSong-Z01",
    "strong": "FZXiaoBiaoSong-B05",
    "emph": "FZKai-Z03",
  )
)

#let set-font(lang: "en", body) = {
  show math.equation: set text(font: "Libertinus Math")

  if lang == "en" {
    set text(font: base-font, lang: "en")
    body
  }
  else if lang in i18n-fonts.keys() {
    let lang-font = i18n-fonts.at(lang)
    if type(lang-font) == str {
      set font(font: (base-font, lang-font), lang: lang)
      body
    } else if type(lang-font) == dictionary {
      set text(font: (base-font, lang-font.at("base")), lang: lang)

      show emph: set text(font: (base-font, lang-font.at("emph")))
      show strong: set text(font: (base-font, lang-font.at("strong")))
      body
    }
  } else {
    assert(false, message: "Font for language " + lang + " not supported")
  }
}

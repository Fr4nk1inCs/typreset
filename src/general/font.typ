/* Font settings for all presets */

#let base-font = "Linux Libertine"

#let math-font = "Libertinus Math"

#let i18n-fonts = (
  "zh-cn": (
    "base": "FZShuSong-Z01S",
    "strong": "FZXiaoBiaoSong-B05S",
    "emph": "FZKai-Z03S",
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
    let lang = if lang.contains("-") { lang.split("-").at(0) } else { lang }
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

#import "template.typ": *

#show: note.with(
  title: "Manual",
  author: "Fr4nk1in-USTC",
  date: none,
  logo: none,
)

= Environments <env>

== Presets

The following presets are available.

=== Definition

#definition[
  #lorem(20)
  测试
]

```typst
#definition[
  #lorem(20)
]
```
If you want to define a named definition, use the `name` parameter:

#definition(name: "named-def")[
  #lorem(20)
]

```typst
#definition(name: "named-def")[
  #lorem(20)
]
```

If you don't want the definition to be numbered, use the `numbered` parameter.

#definition(numbered: false)[
  #lorem(20)
]

```typst
#definition(numbered: false)[
  #lorem(20)
]
```

The `name` and `numbered` parameter is optional, and can be used for all envs.

=== Theorem

#theorem[
  #lorem(20)
]

```typst
#theorem[
  #lorem(20)
]
```

=== Corollary

#corollary[
  #lorem(20)
]

```typst
#corollary[
  #lorem(20)
]
```

=== Lemma

#lemma[
  #lorem(20)
]

```typst
#lemma[
  #lorem(20)
]
```

=== Proof

`Proof` is a little different, it has no frame or background.

#proof[
  #lorem(20)
]

```typst
#proof[
  #lorem(20)
]
```

== Defining your own envs

You can define your own envs from the `base_env` function. For example, the 
`theorem` env is defined like this:

```typst
#let theorem(body, name: none, numbered: true) = {
  base_env(
    type: "Theorem",
    name: name,
    numbered: numbered,
    fg: blue,
    bg: rgb("#e8e8f8"),
    body
  )
}
```

You can make a new `remark` env like this:

```typst
#let recall(body, name: none) = {
  base_env(
    type: "Recall",
    name: name,
    numbered: false,
    fg: luma(40%),
    bg: luma(80%),
    body
  )
}
```

#let recall(body, name: none) = {
  base_env(
    type: "Recall",
    name: name,
    numbered: false,
    fg: luma(40%),
    bg: luma(90%),
    body
  )
}

It will look like this:

#recall[
  #lorem(20)
]

```typst
#recall[
  #lorem(20)
]
```

#pagebreak()

#(chinese = true)
#set text(font: ("Times New Roman", "FandolSong"), lang: "zh")
#set heading(numbering: (..nums) => {
  let nums = nums.pos()
  let length = nums.len();
  if length == 1 {
    if chinese {
      let num = nums.first()
      let count = ""
      while num != 0 {
        count = "零一二三四五六七八九".at(3 * calc.mod(num, 10)) + count
        num = calc.floor(num / 10)
      }
      "第" + count + "章"
    } else {
      "Chapter " + str(nums.first()) + "."
    }
  } else {
    nums.map(str).join(".")
  }
})

#align(center, block(inset: 5pt, radius: 5pt, fill: luma(240), align(left)[
  From now on, Simplified Chinese is supported. You can see the difference in 
  the fonts and other things. 

  *Note* that you should have *Fandol* font in *True Type* installed 
  *systemwide* to let Typst detect the font correctly. 
]))

= 简体中文支持 Simplified Chinese Support

== 主要变化 Major changes

We use Fandol fonts (the same as LaTeX's Ctex package's choice) for Chinese.
Due to Typst's font management and some small issues, we choose
_Times New Roman_ for Latin characters.

To enable Chinese Support, change the first line of the template from

```typst
#let chinese = false
```

to

```typst
#let chinese = true
```

After changing the first line, the label of envirments in @env
will also be in Chinese:
  - Definition $->$ 定义
  - Theorem $->$ 定理
  - Corollary $->$ 推论
  - Lemma $->$ 引理
  - Proof $->$ 证明

== 演示 Demo

#show emph: it => {
  text(font: ("Times New Roman", "FandolKai"), style: "italic", it.body)
}

- Plain: 默认 plain
- Bold: *粗体 bold*
- Emph: _斜体 emph_

#let theorem(body, name: none, numbered: true) = {
  base_env(
    type: if chinese { "定理" } else { "Theorem" },
    name: name,
    numbered: numbered,
    fg: blue,
    bg: rgb("#e8e8f8"),
    body
  )
}

#let proof(body) = block(spacing: 11.5pt, {
  emph[ #if chinese { "证明" } else { "Proof." }]
  [ ] + body
  h(1fr)
  box(scale(160%, origin: bottom + right, sym.square.stroked))
})

#theorem[
  #lorem(20)
  这是一条定理.
]

#proof[#lorem(20)]

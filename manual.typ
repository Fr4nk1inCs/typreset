#import "template.typ": *

#show: note.with(
  title: "Notebook",
  author: "Author",
  date: none,
  logo: none,
)

= Manual

== Presets

The following presets are available.

=== Definition

#definition[
  #lorem(20)
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


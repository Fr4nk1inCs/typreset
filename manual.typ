#import "template.typ": *

#show: note.with(
  title: "Manual",
  author: "Fr4nk1in-USTC",
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
#let theorem = base_env.with(
  type: "Theorem",
  fg: blue,
  bg: rgb("#e8e8f8"),
)
```

You can make a new `recall` env like this:

```typst
#let recall = base_env.with(
  type: "Recall",
  numbered: false,
  fg: luma(40%),
  bg: luma(80%),
)
```

#let recall = base_env.with(
  type: "Recall",
  numbered: false,
  fg: luma(40%),
  bg: luma(80%),
)

It will look like this:

#recall[
  #lorem(20)
]

```typst
#recall[
  #lorem(20)
]
```


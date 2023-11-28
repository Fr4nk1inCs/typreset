#import "../src/lib.typ": thm-envs

#let (theorem, definition, lemma, corollary, proof) = thm-envs.presets()
#let thm-base = thm-envs.thm-base

#set heading(numbering: "1.")

= Basic Test

#theorem[
  #lorem(20)
]

#theorem[
  #lorem(20)
]

#definition[
  #lorem(20)
]

#lemma[
  #lorem(20)
]

#corollary[
  #lorem(20)
]

#proof[
  #lorem(20)
]

= Heading Counter Test

#theorem[
  #lorem(20)
]

= Label & Link Test

#theorem[
  #lorem(20)
] <thm>

Link to previous theorem: @thm

= Self-Defined Theorem Environments

```typ
#let recall = thm-base(type: "Recall", color: gray)
```

#let recall = thm-base(type: "Recall", color: gray)

#recall[
  #lorem(20)
]
#import "../src/lib.typ": homework

#let simple_question = homework.simple_question
#let complex_question = homework.complex_question

#show: homework.style.with(
  course: "Test Course",
  number: 1,
  names: ("Test Name 1", "Test Name 2"),
  ids: ("Test ID 1", "Test ID 2"),
  lang: "en"
)

#show raw.where(block: true): block.with(
  width: 100%,
  stroke: 1pt,
  radius: 5pt,
  breakable: true,
  inset: 5pt
)

#simple_question()[
  A Simple Question Frame
]

_A_: This is a simple question frame.

Minimal Typst code to show the frame above:
```typ
#import "../../src/lib.typ": homework
#let simple_question = homework.simple_question

#simple_question()[
  A Simple Question Frame
]

_A_: This is a simple question frame.
```

#simple_question()[
  Yet Another Simple Question Frame
]

_A_: The number of question is auto incremented.

Minimal Typst code to show the frame above:

#simple_question(number: "Custom Question Number.")[
  A Question Frame with Custom Number
]
_A_: You can custom the question number using the `number` field. Note that the number is not incremented if `number` is not `auto`.

Minimal Typst code to show the frame above (with previous import and definition):
```typ
#simple_question(number: "Custom Question Number.")[
  A Question Frame with Custom Number
]
_A_: You can custom the question number using the `number` field. Note that the number is not incremented if `number` is not `auto`.
```

#complex_question()[
  Here is a complex question frame. You can write any description here. For example, here is a enum list:
  + First item
  + Second item
  + ...
]
_A_: A complex question frame is often used to describe a question with detailed description which you can easily write (or copy paste) using Typst syntax.

Minimal Typst code to show the frame above:
```typ
#import "../../src/lib.typ": homework
#let complex_question = homework.complex_question

#complex_question()[
  Here is a complex question frame. You can write any description here. For example, here is a enum list:
  + First item
  + Second item
  + ...
]
_A_: A complex question frame is often used to describe a question with detailed description which you can easily write (or copy paste) using Typst syntax.
```
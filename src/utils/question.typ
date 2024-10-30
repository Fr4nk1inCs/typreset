#let question_counter = counter("question")

// simple question frame
// - heading-counter(bool): whether to show heading counter
// - number(auto | str | int): question number, if auto, then it will be auto-incremented
// - desc(content): question description
#let simple_question(
  heading-counter: false,
  number: auto,
  desc,
) = (
  context {
    set text(weight: "bold")
    if number == auto {
      question_counter.step()
      if heading-counter {
        str(counter(heading)) + "." + question_counter.display("1.")
      } else {
        question_counter.display("1.")
      }
    } else {
      if type(number) == int {
        str(number) + "."
      } else {
        number
      }
    }
    desc
    v(-0.9em)
    line(length: 100%)
    v(-0.6em)
  }
)

// complex question frame
// - heading-counter(bool): whether to show heading counter
// - number(auto | str | int): question number, if `auto`, then it will be auto-incremented. (`auto` is default)
// - desc(content): question description
#let complex_question(
  heading-counter: false,
  number: auto,
  desc,
) = (
  context {
    let number = if number == auto {
      question_counter.step()
      if heading-counter {
        str(counter(heading)) + "." + question_counter.display("1.")
      } else {
        question_counter.display("1.")
      }
    } else {
      if type(number) == int {
        str(number) + "."
      } else {
        number
      }
    }
    rect(width: 100%, radius: 5pt)[
      #strong(number)
      #desc
    ]
  }
)

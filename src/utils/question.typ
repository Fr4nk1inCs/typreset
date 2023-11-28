#let question_counter = counter("question")

// simple question frame
// - number(auto | str | int): question number, if auto, then it will be auto-incremented
// - desc(content): question description
#let simple_question(number: auto, desc) = {
  set text(weight: "bold")
  if number == auto {
    question_counter.step()
    question_counter.display("1.")
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

// complex question frame
// - number(auto | str | int): question number, if `auto`, then it will be auto-incremented. (`auto` is default)
// - desc(content): question description
#let complex_question(number: auto, desc) = {
  let number = if number == auto {
    question_counter.step()
    question_counter.display("1.")
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

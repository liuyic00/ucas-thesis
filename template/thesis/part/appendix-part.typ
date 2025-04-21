#let appendix-part(rest) = {
  counter(heading).update(0)
  show heading.where(level: 1): set heading(
    numbering: nums => if counter(heading).at(label("ucas-appendix-end")).first() > 1 {
      numbering("附录一", nums) + h(0.7em)
    } else {
      "附录" + h(0.7em)
    },
  )

  [#metadata("ucas-appendix-begin")<ucas-appendix-begin>]
  rest
  [#metadata("ucas-appendix-end")<ucas-appendix-end>]
}

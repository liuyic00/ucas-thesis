
#let ucas-enum-number(level) = {
  import "@preview/numbly:0.1.0": numbly

  counter("ucas-enum-number-in-par").step(level: level)
  context {
    numbering(
      numbly(
        (..num) => {
          box(align(right)[（], width: 1em)
          [#num.pos().first()]
          box(align(left)[）], width: 1em)
        },
        "{2:①}",
      ),
      ..counter("ucas-enum-number-in-par").get(),
    )
  }
}
#let ucas-enum-number-reset(level) = {
  counter("ucas-enum-number-in-par").update((..num) => { num.pos().slice(0, count: level - 1) })
}

#let ucas-enum-number-show-rules(rest) = {
  show heading: it => {
    ucas-enum-number-reset(1)
    it
  }
  rest
}

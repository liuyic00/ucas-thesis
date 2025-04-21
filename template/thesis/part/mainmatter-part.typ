#let mainmatter-part(rest) = {
  import "@preview/numbly:0.1.0": numbly
  set heading(
    numbering: (..nums) => {
      (numbly("第{1}章", "{1}.{2}", "{1}.{2}.{3}", "{1}.{2}.{3}.{4}"))(..nums) + h(0.7em)
    },
  )

  rest
}

#let bibliography-page(bibliography-abs-path) = {
  import "@preview/modern-nju-thesis:0.4.0": bilingual-bibliography

  bilingual-bibliography(bibliography: bibliography.with(bibliography-abs-path))
}

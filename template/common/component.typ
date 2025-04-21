#import "style.typ": *

#let ucas-logo-regular = image("img/ucas-logo-regular.png")
#let ucas-logo-flourish = image("img/ucas-logo-flourish.png")
#let ucas-logo-thesis-word = image("img/ucas-logo-thesis-word.png")

#let info-table-cell(text, colspan) = table.cell(
  colspan: colspan,
  stroke: (bottom: 1.5pt),
  text,
)
#let info-table(columns: (auto, 1fr) * 2, ..infos) = {
  table(
    columns: columns,
    align: center + bottom,
    stroke: none,
    ..{
      let is-input = false
      let infos = infos.pos().flatten()
      let i = 0
      while i < infos.len() {
        let info = infos.at(i)
        i = i + 1
        let colspan = 1
        if i < infos.len() and type(infos.at(i)) == int {
          colspan = infos.at(i)
          i = i + 1
        }
        if is-input {
          (info-table-cell(info, colspan),)
        } else {
          (table.cell(colspan: colspan, info),)
        }
        is-input = not is-input
      }
    }
  )
}

#let empty-par() = layout(size => {
  let (height,) = measure(par[空一行])
  v(height)
})

#let blanked(content, fill: none) = {
  box(
    layout(size => {
      let (height, width) = measure(content)
      box(width: width, height: height, fill: fill)
    }),
  )
}


// word count
// https://github.com/jtchen2k/modern-ecnu-thesis/blob/b3430ed6d014b6e7e3eb309a6250ea537d340db9/utils/word-counter.typ

#import "@preview/wordometer:0.1.4": *
#let word-count-cjk(content, ..options) = {
  let stats = word-count-of(
    content,
    exclude: (heading),
    counter: s => (
      characters: s.replace(regex("\s+"), "").clusters().len(),
      words: s.matches(regex("\b[\w'’.,\-]+\b")).len(),
      words-cjk: s.matches(regex("[，。；：！？‘’“”（）「」【】…—]|[\p{Han}]|[\p{Latin}'’.,\-]+")).len(),
    ),
    ..options,
  )
  state("total-words-cjk").update(prev => prev + stats.words-cjk)
  state("total-words").update(prev => prev + stats.words)
  state("total-characters").update(prev => prev + stats.characters)
  content
}
#let total-words = context state("total-words-cjk").final()
#let total-characters = context state("total-characters").final()
#let word-count-cjk-gen-metadata() = context [
  #metadata(state("total-words-cjk").final()) <total-words>
  #metadata(state("total-characters").final()) <total-chars>
]

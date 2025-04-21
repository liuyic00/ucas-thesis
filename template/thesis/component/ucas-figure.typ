#import "../../common/lib.typ": *
#import style: *

#let ucas-figure(
  body,
  caption: [\<caption\>],
  caption-en: [\<caption-en\>],
  annotation: none,
  lab: none,
  caption-repeated: (total, repeat) => if repeat > 0 { if total <= 2 [（续表）] else [（续表#repeat）] } else [],
  caption-repeated-en: (total, repeat) => if repeat > 0 {
    if total <= 2 [ (continued)] else [ (continued #repeat)]
  } else [],
  ..args,
) = {
  let annotation-block = if annotation != none {
    set text(size: 字号.五号, weight: "regular")
    set align(left)
    block(
      above: 0.765em,
      below: 0.765em,
      width: 100%,
      grid(
        columns: 3,
        text(size: 字号.小四, h(2em)), [*注：*#h(0.01em)], annotation,
      ),
    )
  } else {
    none
  }

  show figure: it => {
    let supplement-en = "unknown"
    let is-subfigure = it.kind == "ucas-subfigure"
    let kind = it.kind
    if (it.kind == table) {
      supplement-en = "Table"
    } else if (it.kind == image) {
      supplement-en = "Figure"
    }

    show figure.caption: it => context {
      let numbering = it.counter.display(it.numbering)
      if is-subfigure {
        [#it.supplement #numbering #it.body]
      } else {
        let total = counter("ucas-table-repeat")
          .at(query(selector(<ucas-figure-end>).after(here())).first().location())
          .first()
        let cap(repeat: 0) = context [
          #it.supplement #numbering #h(1em) #it.body#caption-repeated(total, repeat)

          #supplement-en #numbering #h(1em) #caption-en #caption-repeated-en(total, repeat)
        ]
        cap(repeat: 0)
        if kind == image { annotation-block }
        state("ucas-caption-repeated-func", none).update(it => (
          repeat => [#cap(repeat: repeat)<ucas-caption-repeated>]
        ))
      }
    }

    it
  }

  counter(figure.where(kind: "ucas-subfigure")).update(0)
  [#figure(body, caption: caption, ..args) #if lab != none { label(lab) }]

  state("ucas-figure-annotation").update(annotation-block)
  [#metadata("ucas-figure-end")<ucas-figure-end>]
  state("ucas-caption-repeated").update(none)
}

#let ucas-subfigure(body, lab: none, ..args) = {
  [#figure(body, kind: "ucas-subfigure", supplement: none, numbering: "a)", gap: 0.65em, ..args)
    #if lab != none { label(lab) }]
}

#import "../common/lib.typ": *
#import style: *

#let cn-support(rest) = {
  // - 支持中文粗体
  import "@preview/cuti:0.2.1": *
  show: show-cn-fakebold

  // - 删除换行带来的空格
  // 注意 这种方法可能会多删或者漏删
  import "@preview/cjk-unbreak:0.1.0": *
  show: remove-cjk-break-space

  rest
}

#let global-style(rest) = {
  // - 页边距
  set page(
    paper: "a4",
    margin: (top: 2.54cm, bottom: 2.54cm, left: 3.17cm, right: 3.17cm),
  )
  // - 设置下划线样式
  set underline(evade: false)

  rest
}


#let show-rules(rest) = {
  // - 设置字体
  // 正文：字体
  set text(font: 字体.宋体, size: 字号.小四, lang: "zh")
  // 标题：字体，位置
  show heading: set text(
    font: 字体.Times黑体,
    size: 字号.小四,
    weight: "regular",
  )
  show heading.where(level: 1): set align(center)
  show heading.where(level: 1): set text(size: 字号.四号, weight: "bold")

  // - 设置段前段后，行距
  // 正文：1.25倍行距，段前段后0
  set par(
    spacing: 0em,
    leading: 0.765em,
    justify: true, // 两端对齐
    first-line-indent: (amount: 2em, all: true), // 首行缩进 2 字符
  )
  show par: it => {
    it
    v(0.765em)
  }
  show bibliography: set par(spacing: 0.765em)
  // 标题：单倍行距
  show heading: set par(leading: 0.583em)
  show heading: it => {
    v(0.583em * 0.32)
    it
    v(0.583em * 0.68)
  }
  // 标题：段前段后
  show heading.where(level: 1): set block(above: 24pt, below: 18pt)
  show heading.where(level: 2): set block(above: 24pt, below: 6pt)
  show heading.where(level: 3): set block(above: 12pt, below: 6pt)
  show heading.where(level: 4): set block(above: 12pt, below: 6pt)

  // 一级标题换页
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(24pt)
    it
  }

  // - 模板中没有要求的部分，调整默认样式
  // 补偿 par(spacing: 0em) 和 par v(0.765em)
  show list: it => {
    show par: i => {
      i
      v(-0.765em)
    }
    it
  }
  show list: set par(spacing: 0.765em)

  rest
}

#let set-header(title: "<title>", rest) = {
  // 页眉
  set page(
    header: context {
      set align(center)
      set text(font: 字体.宋体, size: 字号.小五)
      let page-number = counter(page).get().first()
      if calc.even(page-number) {
        title
      } else {
        let afters = query(heading.where(level: 1).after(here()))
        let after = if (afters.len() == 0) { none } else { afters.first() }
        let head = if (after == none or counter(page).at(after.location()).first() > page-number) {
          let befores = query(heading.where(level: 1).before(here()))
          if (befores.len() == 0) { none } else {
            befores.last()
          }
        } else {
          after
        }
        if head == none {
          [not found]
        } else if head.body == [图目录] or head.body == [表目录] {
          [图表目录]
        } else {
          if head.numbering == none {
            head.body
          } else {
            {
              show h: none
              numbering(head.numbering, ..(counter(heading).at(head.location())))
            }
            h(0.5em)
            head.body
          }
        }
      }
      line(length: 100%, stroke: 0.5pt)
    },
    header-ascent: .5cm,
  )
  rest
}

#let set-front-footer(rest) = {
  set page(
    numbering: "I",
    footer: context {
      set text(size: 字号.小五)
      set align(center)
      counter(page).display(page.numbering)
    },
  )
  rest
}

#let set-main-footer(rest) = {
  set page(
    footer: context {
      let page-num = counter(page).get().first()
      set text(size: 字号.小五)
      align(if calc.odd(page-num) { right } else { left })[#page-num]
    },
  )
  rest
}

#let figure-show-rules(rest) = {
  // 图表公式：编号
  show: numbering-figure-and-equation-after-chapter

  // - 图表标题
  show figure.caption: set text(size: 字号.五号, weight: "bold")
  show figure.caption: set par(spacing: 2pt)
  show figure.where(kind: image): set figure(gap: 1em)
  show figure.where(kind: image): set block(below: 1em)
  show figure.where(kind: table): set figure(gap: 0em)
  show figure.where(kind: table): set block(above: 1em, below: 1em)
  show figure.where(kind: table): set figure.caption(position: top)

  show <ucas-caption-repeated>: set text(size: 字号.五号, weight: "bold")
  show <ucas-caption-repeated>: set par(spacing: 2pt)
  show <ucas-caption-repeated>: it => {
    v(-4pt)
    it
    v(6pt)
  }
  show figure.where(kind: table): set block(breakable: true)
  set table.hline(stroke: 0.5pt + black)

  rest
}

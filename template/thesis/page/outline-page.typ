#import "../../common/lib.typ": *
#import style: *

#let outline-page(title: [目#h(1em)录], depth: 3, figures: true) = {
  set outline(indent: 1em)
  // 删除标题和编号中使用 h 生成的格式化空隙
  show outline.entry: it => link(
    it.element.location(),
    it.indented(
      if (it.prefix() == none) { none } else {
        show h: none
        it.prefix()
      },
      {
        {
          show h: none
          it.body()
        }
        h(.05em)
        box(it.fill, width: 1fr)
        it.page()
      },
    ),
  )

  set text(font: 字体.Times黑体)
  set outline.entry(fill: repeat([.], gap: -0.001em))
  show outline.entry: set text(size: 字号.小四)
  show outline.entry.where(level: 1): set text(size: 字号.四号)
  show outline.entry.where(level: 1): set block(above: 13pt, below: 14pt)
  show outline.entry.where(level: 2): set block(above: 13pt, below: 13pt)
  show outline.entry.where(level: 3): set block(above: 7pt, below: 0pt)


  {
    set pagebreak(to: "odd")
    show heading: set block(below: 45pt)
    outline(title: title, depth: depth)
  }

  if figures {
    show heading: set block(above: 31pt, below: 21pt)
    {
      set pagebreak(to: "odd")
      outline(title: [图目录], target: figure.where(kind: image))
      show pagebreak: none
      outline(title: [表目录], target: figure.where(kind: table))
    }
  }
}

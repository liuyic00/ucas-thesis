#import "../../common/lib.typ": *

#let acknowledgement-page(content, date: datetime) = {
  heading(numbering: none)[致#h(1em)谢]

  content

  component.empty-par()

  par(first-line-indent: 0em)[
    #date.display("[year] 年 [month padding:none] 月")
  ]
}

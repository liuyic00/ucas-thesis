#import "../../common/lib.typ": *
#import style: *

#import "../component/ucas-anonymous.typ": ucas-anonymous-bypath

#let cover-ucas-logo-regular = {
  // size from Word template
  set image(height: 2.16cm, width: 12.81cm)
  component.ucas-logo-regular
}
#let cover-ucas-logo-regular-with-v = {
  v(0.56cm)
  cover-ucas-logo-regular
}

#let cover-ucas-logo-flourish = {
  // size from Word template
  set image(height: 2.19cm, width: 10.45cm)
  component.ucas-logo-flourish
}
#let cover-ucas-logo-flourish-with-v = {
  v(0.12cm)
  cover-ucas-logo-flourish
}

#let cover-ucas-logo-thesis-word = {
  set image(height: 2.19cm, width: 10.45cm)
  component.ucas-logo-thesis-word
}

#let cover-ucas-logo-thesis-word-with-v = {
  v(1.4cm)
  cover-ucas-logo-thesis-word
}

#let cover-page(
  anonymous: false,
  degree-level: "博士/硕士",
  thesis-type: auto,
  title: "中文论文题目",
  info-table-columns: (auto, 1fr),
  info-table: (
    ([作者姓名：], [作者姓名]),
    ([指导教师：], [教师姓名]),
    ([ ], [工作单位]),
    ([学位类别：], [学科门类或专业学位类别]),
    ([学科专业：], [学科专业]),
    ([培养单位：], [中国科学院××研究所或中国科学院大学××学院]),
  ),
  time: "xxxx 年 xx 月",
) = {
  set page(numbering: none)
  set align(center)

  if thesis-type == auto {
    if degree-level == "硕士" {
      thesis-type = "硕士学位论文"
    } else if degree-level == "博士" {
      thesis-type = "博士学位论文"
    } else {
      thesis-type = "硕士/博士学位论文"
    }
  }

  page({
    ucas-anonymous-bypath(anonymous, cover-ucas-logo-thesis-word-with-v)
    v(0.74cm)
    text(font: 字体.Times黑体, size: 字号.一号, weight: "bold", thesis-type)
    v(1.02cm)
    text(
      font: 字体.Times黑体,
      size: 字号.小三,
      weight: "bold",
      underline(offset: .16em, stroke: .1em, evade: false, title),
    )
    v(1fr)
    block(
      inset: (left: -0.2cm, bottom: .2cm),
      {
        set text(font: 字体.宋体, size: 字号.四号, weight: "bold")
        set table(row-gutter: .58cm, column-gutter: .15cm)
        set table.cell(inset: (bottom: .1cm))
        component.info-table(columns: info-table-columns, ..info-table)
      },
    )
    v(1fr)
    text(font: 字体.宋体, size: 字号.四号, weight: "bold", time)
    v(1.69cm)
  })
}

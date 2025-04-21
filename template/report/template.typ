#import "../common/lib.typ": *
#import style: *

#import "../thesis/template.typ" as _thesis-template

#let show-rules(rest) = {
  show: _thesis-template.show-rules
  import "@preview/numbly:0.1.0": numbly
  set heading(numbering: numbly("{1:一}", "{1}.{2}", "{1}.{2}.{3}", "{1}.{2}.{3}.{4}"))

  rest
}

#let cover-page(
  title-report-type: "报告种类",
  title: "",
  info-table-columns: (auto, 1fr) * 2,
  info-table: (
    ([报告题目], [报告题目], 3),
    ([学生姓名], [张三], [学号], [1234123412341234]),
    ([指导教师], [李四], [职称], [研究员]),
    ([学位类别], [工学硕士], 3),
    ([学科专业], [计算xxxxx], 3),
    ([研究方向], [xxx技术], 3),
    ([培养单位], [中国科学院xx研究所], 3),
    ([填表日期], [2024 年 06 月], 3),
  ),
) = {
  set align(center)
  set image(height: 2.16cm, width: 12.81cm)
  set page(numbering: none)

  page[
    #v(0.56cm)

    #component.ucas-logo-regular

    #text(size: 字号.一号, weight: "bold", title-report-type)
    #parbreak()
    #text(size: 字号.一号, weight: "bold", title)

    #v(3fr)

    #component.info-table(columns: info-table-columns, ..info-table)

    #v(1fr)
    #text(size: 字号.小三, weight: "bold")[中国科学院大学制]
    #v(3cm)
  ]
}

#let gen() = {
  import "../thesis/template.typ" as thesis-template
  (
    show-rules: show-rules,
    // cover-page 直接填写，不通过 gen 设置内容
    cover-page: cover-page,
    outline-page: _thesis-template.outline-page.with(title: "报告提纲", figures: false),
    mainmatter-part: _thesis-template.mainmatter-part,
  )
}

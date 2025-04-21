#import "../../common/lib.typ": *
#import style: *

#import "../component/ucas-anonymous.typ": ucas-anonymous-bypath

#let en-info-page(
  anonymous: false,
  degree-level: "<degree-level: 博士/硕士>",
  title-en: [#"<title-en>"],
  thesis-type-en: auto,
  degree-type-en: [#"<degree-type-en>"],
  major-en: [#"<major-en>"],
  author-en: [#"<author-en>"],
  supervisor-en: [#"<supervisor-en>"],
  author-affiliation-en: [#"<author-affiliation-en>"],
  date: datetime,
) = {
  if thesis-type-en == auto {
    if degree-level == "博士" {
      thesis-type-en = "dissertation"
    } else if degree-level == "硕士" {
      thesis-type-en = "thesis"
    } else {
      thesis-type-en = "dissertation/thesis(by cfg-degree-level)"
    }
  }

  set align(center)
  set par(justify: false)

  page(numbering: none)[
    #set text(font: "Times New Roman", size: 字号.四号, weight: "bold")
    #set par(spacing: 1.665em)

    #v(1.13fr)
    #underline(text(title-en, size: 字号.小三))
    #v(1fr)
    A #thesis-type-en submitted to

    #ucas-anonymous-bypath(anonymous)[University of Chinese Academy of Sciences]

    in partial fulfillment of the requirement

    for the degree of

    #degree-type-en

    In #major-en

    By

    #ucas-anonymous-bypath(anonymous, author-en)

    Supervisor: #ucas-anonymous-bypath(anonymous, supervisor-en)

    #v(1.25cm)

    #ucas-anonymous-bypath(anonymous, author-affiliation-en)

    #date.display("[month repr:long] [year]")

    #v(4.1cm)
  ]
}

#import "template.typ": *

#import "page/abstract-page.typ": abstract-page
#import "page/acknowledgement-page.typ": acknowledgement-page
#import "page/bibliography-page.typ": bibliography-page
#import "page/book-spine-page.typ": book-spine-page
#import "page/cover-page.typ": cover-page
#import "page/cv-page.typ": cv-page
#import "page/declaration-page.typ": declaration-page
#import "page/en-info-page.typ": en-info-page
#import "page/outline-page.typ": outline-page

#import "part/appendix-part.typ": appendix-part
#import "part/mainmatter-part.typ": mainmatter-part

#import "component/ucas-anonymous.typ": ucas-anonymous, ucas-anonymous-bypath
#import "component/ucas-enum-number.typ": ucas-enum-number, ucas-enum-number-reset, ucas-enum-number-show-rules
#import "component/ucas-figure.typ": ucas-figure, ucas-subfigure
#import "component/ucas-modify.typ": ucas-add, ucas-del
#import "component/ucas-table.typ": ucas-table
#import "../common/component.typ": word-count-cjk, word-count-cjk-gen-metadata

#let document(
  anonymous: false,
  // cover-page
  degree-level: "<degree-level: 博士/硕士>",
  thesis-type: auto,
  title: [#"<title>"],
  author: [#"<author>"],
  supervisor: [#"<supervisor>"],
  supervisor-affiliation: [#"<supervisor-affiliation>"],
  degree-type: [#"<degree-type>"],
  major: [#"<major>"],
  author-affiliation: [#"<author-affiliation>"],
  date: datetime.today(),
  // en-info-page
  title-en: [#"<title-en>"],
  thesis-type-en: auto,
  degree-type-en: [#"<degree-type-en>"],
  major-en: [#"<major-en>"],
  author-en: [#"<author-en>"],
  supervisor-en: [#"<supervisor-en>"],
  author-affiliation-en: [#"<author-affiliation-en>"],
  // declaration-page
  // book-spine-page
  has-book-spine-page: true,
  // abstract-page
  abstract-cn: [],
  abstract-en: [],
  keywords-cn: ([关键词1], [关键词2]),
  keywords-en: ([Keyword1], [Keyword2]),
  // outline-page
  // mainmatter-part
  mainmatter: [],
  // bibliography-page
  bibliography-abs-path: "",
  // appendix-part
  appendix: [],
  // acknowledgement-page
  acknowledgement: [],
  // cv-page
  cv-history: [],
  cv-achievement: [],
) = {
  show: cn-support
  show: global-style

  state("ucas-anonymous").update(anonymous)

  // - 封面及声明
  {
    cover-page(
      anonymous: anonymous,
      degree-level: degree-level,
      thesis-type: thesis-type,
      title: title,
      info-table-columns: (auto, 1fr),
      info-table: (
        ([作者姓名：], ucas-anonymous-bypath(anonymous, author)),
        ([指导教师：], ucas-anonymous-bypath(anonymous, supervisor)),
        ([ ], ucas-anonymous-bypath(anonymous, supervisor-affiliation)),
        ([学位类别：], degree-type),
        ([学科专业：], major),
        ([培养单位：], ucas-anonymous-bypath(anonymous, author-affiliation)),
      ),
      time: date.display("[year] 年 [month padding:none] 月"),
    )

    en-info-page(
      anonymous: anonymous,
      degree-level: degree-level,
      title-en: title-en,
      thesis-type-en: thesis-type-en,
      degree-type-en: degree-type-en,
      major-en: major-en,
      author-en: author-en,
      supervisor-en: supervisor-en,
      author-affiliation-en: author-affiliation-en,
      date: date,
    )

    declaration-page(anonymous: anonymous)

    if (has-book-spine-page) {
      book-spine-page(
        anonymous: anonymous,
        title: title,
        author: author,
      )
    }
  }

  show: show-rules
  show: set-header.with(title: title)
  // - 摘要目录
  {
    counter(page).update(1)
    show: set-front-footer
    set heading(outlined: false, numbering: none)
    set pagebreak(to: "odd")

    abstract-page(
      abstract-cn: abstract-cn,
      abstract-en: abstract-en,
      keywords-cn: keywords-cn,
      keywords-en: keywords-en,
    )

    outline-page()

    pagebreak(to: "odd")
  }

  // - 主体及其余
  {
    counter(page).update(1)
    show: set-main-footer
    show: figure-show-rules
    show: ucas-enum-number-show-rules

    {
      show: word-count-cjk
      mainmatter-part(mainmatter)
      context [#metadata(counter(page).get().first()) <mainmatter-pages>]
    }

    set pagebreak(to: "odd")

    bibliography-page(bibliography-abs-path)

    {
      show: word-count-cjk
      appendix-part(appendix)
    }

    if not anonymous {
      acknowledgement-page(date: date, acknowledgement)
    }

    cv-page(cv-history, cv-achievement, anonymous: anonymous)
  }

  word-count-cjk-gen-metadata()
}

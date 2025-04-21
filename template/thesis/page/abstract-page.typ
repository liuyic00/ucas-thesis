#import "../../common/lib.typ": *

#let abstract-page(
  abstract-cn: "<abstract-cn>",
  keywords-cn: ("<keywords-cn.at(1)>", "<keywords-cn.at(2)>"),
  abstract-en: "<abstract-en>",
  keywords-en: ("<keywords-en.at(1)>", "<keywords-en.at(2)>"),
) = [
  = 摘#h(1em)要

  #abstract-cn
  #component.empty-par()
  #block[*关键词：*#{keywords-cn.join("，")}]

  = Abstract

  #abstract-en
  #component.empty-par()
  #block[*Key Words:* #{keywords-en.join(", ")}]
]


#import "../../common/lib.typ": *
#import style: *

#import "../component/ucas-anonymous.typ": ucas-anonymous-bypath

#let declaration-page(anonymous: false) = {
  page(numbering: none)[
    #set par(
      leading: 1.1em,
      spacing: 1.2em,
      first-line-indent: (amount: 2em, all: true),
    )
    #set text(font: 字体.宋体, size: 字号.小四)

    #v(1.8cm)

    #align(center)[
      #set text(font: 字体.黑体, size: 字号.四号, weight: "bold")
      #ucas-anonymous-bypath(anonymous)[中国科学院大学]

      研究生学位论文原创性声明
    ]

    #v(.6cm)

    本人郑重声明：
    所呈交的学位论文是本人在导师的指导下独立进行研究工作所取得的成果。
    承诺除文中已经注明引用的内容外，本论文不包含任何其他个人或集体享有著作权的研
    究成果，未在以往任何学位申请中全部或部分提交。
    对本论文所涉及的研究工作做出贡献的其他个人或集体，均已在文中以明确方式标明或
    致谢。
    本人完全意识到本声明的法律结果由本人承担。

    #v(.73cm)

    #align(center)[
      #h(2.5em)作者签名:

      #h(2.5em)日#h(2em)期：
    ]

    #v(1.87cm)

    #align(center)[
      #set text(font: 字体.黑体, size: 字号.四号, weight: "bold")
      #ucas-anonymous-bypath(anonymous)[中国科学院大学]

      学位论文使用授权声明
    ]

    #v(.55cm)

    本人完全了解并同意遵守#ucas-anonymous-bypath(anonymous)[中国科学院大学]有关
    收集、保存和使用学位论文的规定，即#ucas-anonymous-bypath(anonymous)[中国科学
    院大学]有权按照学术研究公开原则和保护知识产权的原则，保留并向国家指定或
    #ucas-anonymous-bypath(anonymous)[中国科学院]指定机构送交学位论文的电子版和
    印刷版文件，且电子版与印刷版内容应完全相同，允许该论文被检索、查阅和借阅，公
    布本学位论文的全部或部分内容，可以采用扫描、影印、缩印等复制手段以及其他法律
    许可的方式保存、汇编本学位论文。

    涉密及延迟公开的学位论文在解密或延迟期后适用本声明。

    #v(.7cm)

    #align(center)[
      #h(-3.3em)作者签名：#h(10em)导师签名：

      #h(-3.3em)日#h(2em)期：#h(10em)日#h(2em)期：
    ]
  ]
}

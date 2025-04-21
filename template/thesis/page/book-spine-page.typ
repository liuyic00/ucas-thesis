#import "../../common/lib.typ": *
#import style: *

#let roted(text) = {
  layout(size => {
    let rota(text) = {
      let (height, width) = measure(box(text))

      box(
        height: width,
        width: height,
        place(
          dx: 0.65em,
          rotate(90deg, origin: left + top, box(text)),
        ),
      )
    }

    let r = regex("[\p{Han}]")
    let last = ""
    let words = {
      for l in text.clusters() {
        if (l.match(r) != none) {
          if (last != "") {
            (rota(last),)
            last = ""
          }
          (l,)
        } else if (l == " ") {
          if (last != "") {
            (rota(last),)
            last = ""
          }
        } else {
          last = last + l
          none
        }
      }
      if (last != "") {
        (rota(last),)
        last = ""
      }
    }
    stack(..words, spacing: 0.44em)
  })
}
#let get-str(t) = {
  import "@preview/touying:0.6.1": utils.is-sequence
  if type(t) == str {
    t
  } else if is-sequence(t) {
    for i in t.children {
      get-str(i)
    }
  } else {
    t.text
  }
}

#let book-spine-page(anonymous: false, title: [论文题目], author: [李四]) = {
  //书脊（此页仅用于制作书脊，不用单独打印放入论文）
  page(numbering: none, margin: 0pt)[
    #set align(center)

    #set text(
      font: 字体.Times黑体,
      size: 字号.小四,
      weight: "bold",
    )

    #block(
      stack(
        v(3cm),
        roted(get-str(title)),
        v(1fr),
        roted(if anonymous { "" } else { get-str(author) }),
        v(1fr),
        roted(if anonymous { "" } else { "中国科学院大学" }),
        v(3cm),
      ),
      height: 100%,
    )
  ]
}

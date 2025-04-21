/// reference: https://github.com/nju-lug/modern-nju-thesis/blob/630a8ecb3f0ea63aae6c120b1dab8d431c9a7bd5/utils/style.typ
#let 字号 = (
  初号: 42pt,
  小初: 36pt,
  一号: 26pt,
  小一: 24pt,
  二号: 22pt,
  小二: 18pt,
  三号: 16pt,
  小三: 15pt,
  四号: 14pt,
  中四: 13pt,
  小四: 12pt,
  五号: 10.5pt,
  小五: 9pt,
  六号: 7.5pt,
  小六: 6.5pt,
  七号: 5.5pt,
  小七: 5pt,
)

/// reference: https://github.com/nju-lug/modern-nju-thesis/blob/630a8ecb3f0ea63aae6c120b1dab8d431c9a7bd5/utils/style.typ
#let 字体 = (
  // 宋体，属于「有衬线字体」，一般可以等同于英文中的 Serif Font
  // 这一行分别是「新罗马体（有衬线英文字体）」、「思源宋体（简体）」、「思源宋体」、「宋体（Windows）」、「宋体（MacOS）」
  宋体: (
    (name: "Times New Roman", covers: "latin-in-cjk"),
    "Source Han Serif SC",
    "Source Han Serif",
    "Noto Serif CJK SC",
    "SimSun",
    "Songti SC",
    "STSongti",
  ),
  // 黑体，属于「无衬线字体」，一般可以等同于英文中的 Sans Serif Font
  // 这一行分别是「Arial（无衬线英文字体）」、「思源黑体（简体）」、「思源黑体」、「黑体（Windows）」、「黑体（MacOS）」
  黑体: (
    (name: "Arial", covers: "latin-in-cjk"),
    "Source Han Sans SC",
    "Source Han Sans",
    "Noto Sans CJK SC",
    "SimHei",
    "Heiti SC",
    "STHeiti",
  ),
  Times黑体: (
    (name: "Times New Roman", covers: "latin-in-cjk"),
    "Source Han Sans SC",
    "Source Han Sans",
    "Noto Sans CJK SC",
    "SimHei",
    "Heiti SC",
    "STHeiti",
  ),
  // 楷体
  楷体: (
    (name: "Times New Roman", covers: "latin-in-cjk"),
    "KaiTi",
    "Kaiti SC",
    "STKaiti",
    "FZKai-Z03S",
    "Noto Serif CJK SC",
  ),
  // 仿宋
  仿宋: (
    (name: "Times New Roman", covers: "latin-in-cjk"),
    "FangSong",
    "FangSong SC",
    "STFangSong",
    "FZFangSong-Z02S",
    "Noto Serif CJK SC",
  ),
  // 等宽字体，用于代码块环境，一般可以等同于英文中的 Monospaced Font
  // 这一行分别是「Courier New（Windows 等宽英文字体）」、「思源等宽黑体（简体）」、「思源等宽黑体」、「黑体（Windows）」、「黑体（MacOS）」
  等宽: (
    "Courier New",
    "Menlo",
    "IBM Plex Mono",
    "Source Han Sans HW SC",
    "Source Han Sans HW",
    "Noto Sans Mono CJK SC",
    "SimHei",
    "Heiti SC",
    "STHeiti",
  ),
)

/// 删除 CJK 中由换行加入的空格
///
/// 该方法并不完善，有可能多删或少删
#let remove-cjk-linebreak-show(rest) = {
  show ([A] + [ ] + [B]).func(): it => {
    let cjk-char = "[\p{Han}，。；：！？‘’“”（）「」【】…—]"
    let ends-with-cjk = it => {
      it != none and it.has("text") and it.text.ends-with(regex(cjk-char))
    }

    let last-item = none
    let flag = false
    let new-it = for item in it.children {
      if item == [ ] and ends-with-cjk(last-item) {
        item = []
        flag = true
      }
      last-item = item
      item
    }
    if flag {
      new-it
    } else {
      // 如果没有删除任何空格，直接返回原始内容，避免 show 反复应用在生成的内容上
      it
    }
  }

  rest
}

/// 按章节编号图表和公式
#let numbering-figure-and-equation-after-chapter(rest) = {
  show heading.where(level: 1): it => {
    // 在新章节重置计数器
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: raw)).update(0)
    counter(math.equation).update(0)
    it
  }
  // show styles: `1-1` for image, code, table, and `(1-1)` for math
  show figure.where(kind: image): set figure(
    numbering: i => [#counter(heading.where(level: 1)).display("1")-#numbering("1", i)],
  )
  show figure.where(kind: table): set figure(
    numbering: i => [#counter(heading.where(level: 1)).display("1")-#numbering("1", i)],
  )
  show figure.where(kind: raw): set figure(
    numbering: i => [#counter(heading.where(level: 1)).display("1")-#numbering("1", i)],
  )
  set math.equation(numbering: i => [(#counter(heading.where(level: 1)).display("1")-#numbering("1", i))])

  rest
}

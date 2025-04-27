#let ucas-del(content) = {
  show text: it => {
    set text(fill: red)
    it
  }
  import "@preview/drafting:0.2.2": *
  margin-note(
    stroke: none,
    move(
      dy: -1.5em,
      block(
        stroke: red,
        outset: 0.3em,
        width: 0.6em,
        height: 0.6em,
        align(center + horizon, line(length: 0.5em, stroke: red)),
      ),
    ),
  )
  strike(content)
}
#let ucas-add(content) = {
  show text: it => {
    set text(fill: blue)
    it
  }
  import "@preview/drafting:0.2.2": *
  margin-note(
    stroke: none,
    move(
      dy: -1.5em,
      block(
        stroke: blue,
        outset: 0.3em,
        width: 0.6em,
        height: 0.6em,
        align(
          center + horizon,
          {
            place(dx: 0.05em, dy: 0.3em, line(length: 0.5em, stroke: blue))
            place(
              dx: 0.05em,
              dy: 0.3em,
              rotate(
                90deg,
                line(length: 0.5em, stroke: blue),
              ),
            )
          },
        ),
      ),
    ),
  )
  content
}

测试
#ucas-del[2333]
#ucas-add[6666]
文字

#let ucas-del(content) = {
  show text: it => {
    set text(fill: red)
    it
  }
  strike(content)
}
#let ucas-add(content) = {
  show text: it => {
    set text(fill: blue)
    it
  }
  content
}

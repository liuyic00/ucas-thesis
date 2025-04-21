#let cv-page(cv-history, cv-achievement, anonymous: false) = {
  heading(numbering: none)[作者简历及攻读学位期间发表的学术论文与其他相关学术成果]
  set par(first-line-indent: 0em)
  [
    #if not anonymous {
      cv-history
    }

    #cv-achievement
  ]
}

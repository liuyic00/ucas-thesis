#import "/template/lib.typ": thesis-template.ucas-anonymous

*已发表（或正式接受）的学术论文：*
// 书写格式同参考文献

#grid(
  columns: 2,
  row-gutter: 0.765em,
  column-gutter: 0.5em,
  [[1]],
  ucas-anonymous(
    [文章信息，书写格式同参考文献，可从参考文献页粘贴过来],
    // 匿名模式使用的替换信息，仅以第几作者注明，不要出现文章名、期卷、作者及他人姓名
    replace: [第一作者. XXXXXXX. 会议名称. 2024],
  ),

  [[2]],
  ucas-anonymous(
    [文章信息，书写格式同参考文献，可从参考文献页粘贴过来],
    replace: [第二作者. XXXXXXX. 期刊名称. 2024],
  ),
)
#v(1em)

*申请或已获得的专利：*
// 书写格式同参考文献，无专利时此项不必列出

#grid(
  columns: 2,
  row-gutter: 0.765em,
  column-gutter: 0.5em,
  [[1]],
  ucas-anonymous(
    [ 专利信息，书写格式同参考文献 ],
    replace: [第一发明人. 专利. 2024], // 匿名模式使用的替换信息
  ),

  [[2]],
  ucas-anonymous(
    [ 专利信息，书写格式同参考文献 ],
    replace: [第二发明人. 专利. 2024],
  ),
)
#v(1em)

*参加的研究项目及获奖情况：*

输入研究项目及获奖情况

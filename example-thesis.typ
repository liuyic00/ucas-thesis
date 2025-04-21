#import "/template/lib.typ": thesis-template

#thesis-template.document(
  anonymous: false, // false: 不匿名. true: 匿名.
  // - cover-page 封面
  degree-level: "硕士", // "硕士" 或 "博士"
  thesis-type: auto, // auto: 根据 degree-level 自动生成. 其他: 自定义.
  title: [基于 Typst 的学位论文模板示例],
  author: [张三一],
  supervisor: [李四二 教授], // 姓名 专业技术职务
  supervisor-affiliation: [中国科学院 Typst 研究所],
  degree-type: [工学硕士], // 学科门类或专业学位类别
  major: [计算机科学与技术], // 科学专业
  author-affiliation: [中国科学院 Typst 研究所], // 中国科学院××研究所或中国科学院大学××学院
  date: datetime(month: 3, year: 2025, day: 1),
  // - en-info-page 英文信息页
  title-en: [An Example of Typst Template for Thesis],
  thesis-type-en: auto, // auto: 根据 degree-level 自动生成. 其他: 自定义
  degree-type-en: [Master of Science in Engineering],
  major-en: [Computer Science and Technology],
  author-en: [Zhang Sanyi],
  supervisor-en: [Li Sier],
  author-affiliation-en: [Institute of Typst Chinese Academy of Sciences],
  // - declaration-page 声明页
  // - book-spine-page 书脊页，仅用于制作书脊，不用单独打印放入论文
  has-book-spine-page: true, // true: 有书脊页. false: 没有书脊页.
  // - abstract-page 摘要
  abstract-cn: include "content/abstract-cn.typ",
  abstract-en: include "content/abstract-en.typ",
  keywords-cn: ([软件开发], [硬件设计], [图论], [最短路]),
  keywords-en: ([Software Development], [Hardware Design], [Graph Theory], [Shortest Path]),
  // - outline-page 目录
  // - mainmatter-part 正文部分
  mainmatter: include "content/mainmatter.typ",
  // - bibliography-page 参考文献
  bibliography-abs-path: "/content/refs.bib", // 需要从项目根目录开始的绝对路径
  // - appendix-part 附录部分
  appendix: include "content/appendix.typ",
  // - acknowledgement-page 致谢
  acknowledgement: include "content/acknowledgement.typ",
  // - cv-page 简历
  cv-history: include "content/cv-history.typ",
  cv-achievement: include "content/cv-achievement.typ",
)

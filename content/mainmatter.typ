#import "/template/lib.typ": thesis-template
#import thesis-template: *

= 绪论

== 标题

=== 标题

==== 标题

=== 标题

== 标题

= 图、表、引用

== 图

所有图表可以使用提供的 `ucas-figure` 来代替原本的 `figure` 方法，来设置英文标题
、注释和标签，并且接受原本的 `figure` 方法的参数。

#{
  //set figure(placement: auto)
  include "/figure/im.typ"
}
图后面的一些文字，是这样的。

== 表

#{
  //set figure(placement: auto)
  include "/figure/tb.typ"
}

== 代码
#{
  //set figure(placement: auto)
  include "/figure/cd.typ"
}

== 公式

$ a = b + c $

== 引用

引用#[@abc2018]说的好

= 其他

== 数字标号

#ucas-enum-number(1) 标号

#ucas-enum-number(1) 标号

#ucas-enum-number(2) 标号

#ucas-enum-number(2) 标号

#ucas-enum-number(1) 标号

#ucas-enum-number(2) 标号

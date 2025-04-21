#import "/template/lib.typ": thesis-template
#import thesis-template: *

#ucas-figure(
  ucas-table(
    columns: 3,
    table.header(
      [a],
      [b],
      [c],
    ),
    [a],
    [b],
    [c],
  ),
  caption: [表题],
  caption-en: [Table title],
  annotation: [一些注释说明文字],
  lab: "tb",
)


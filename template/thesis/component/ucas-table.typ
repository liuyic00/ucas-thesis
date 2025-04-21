#import "../../common/lib.typ": *
#import style: *

#let ucas-table(columns: auto, ..args) = {
  counter("ucas-table-repeat").update(0)
  block[
    #table(
      columns: columns,
      stroke: none,
      align: center + horizon,
      {
        let heads = args.pos().filter(it => it.func() == table.header)
        let column-num = if type(columns) == int { columns } else if type(columns) == array { columns.len() } else { 1 }

        table.header(
          table.cell(
            colspan: column-num,
            context {
              let caption-repeated-func = state("ucas-caption-repeated-func").get()
              if counter("ucas-table-repeat").get().first() > 0 and caption-repeated-func != none {
                block(
                  width: 0em,
                  inset: (x: -(page.width - page.margin.left - page.margin.right) / 2),
                  caption-repeated-func(counter("ucas-table-repeat").get().first()),
                )
              }
              counter("ucas-table-repeat").step()
            },
          ),
          table.hline(),
          ..{
            for head in heads {
              head.children
            }
          },
          table.hline(),
        )
      },
      ..args.pos().filter(it => it.func() != table.header),
      table.hline(),
    )
    #context state("ucas-figure-annotation").at(query(selector(<ucas-figure-end>).after(here())).first().location())
  ]
}

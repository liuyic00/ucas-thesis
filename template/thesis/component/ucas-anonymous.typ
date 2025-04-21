#import "../../common/lib.typ": *
#import style: *

#let ucas-anonymous-bypath(
  ucas-anonymous,
  content,
  replace: auto,
) = {
  if ucas-anonymous {
    if (replace == auto) {
      blanked(content)
    } else {
      replace
    }
  } else {
    content
  }
}

#let ucas-anonymous(
  content,
  replace: auto,
) = {
  context ucas-anonymous-bypath(state("ucas-anonymous", false).get(), content, replace: replace)
}

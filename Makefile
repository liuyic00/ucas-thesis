all: words pages

words:
	typst query thesis.typ "<total-words>" --field value --one 2>/dev/null
pages:
	typst query thesis.typ "<mainmatter-pages>" --field value --one 2>/dev/null
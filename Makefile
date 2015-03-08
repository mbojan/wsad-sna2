files:=cohesion ergm friendship_paradox local_neighborhoods segregation small_world

pandoc=pandoc
pandoc_flags=-s --toc

define run-pandoc
$(pandoc) $(pandoc_flags) $< -o $@
endef

.PHONY: default
default: html


$(files:=.html) $(files:=.pdf): references.bib

$(files:=.html) $(files:=.pdf): pandoc_flags+=--bibliography=references.bib

%.md: %.Rmd
	Rscript -e "knitr::knit('$<', output='$@')"

%.html: %.md
	$(run-pandoc)

.PHONY: html
html: $(files:=.html)

.PHONY: pdf
html: $(files:=.pdf)


.PHONY: editall
editall:
	vim -p $(files:=.Rmd)

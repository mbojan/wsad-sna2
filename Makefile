files:=cohesion ergm friendship_paradox local_neighborhoods segregation small_world Centrality

pandoc=pandoc
pandoc_flags=-s --toc
use_rmarkdown=1

define run-pandoc
$(pandoc) $(pandoc_flags) $< -o $@
endef

define run-rmarkdown
Rscript -e 'rmarkdown::render("$<")'
endef

.PHONY: default
default: html


$(files:=.html) $(files:=.pdf): references.bib _output.yaml

ifeq ($(use_rmarkdown),1) 
%.html: %.Rmd
	$(run-rmarkdown)
else
$(files:=.html) $(files:=.pdf): pandoc_flags+=--bibliography=references.bib

%.md: %.Rmd
	Rscript -e "knitr::knit('$<', output='$@')"

%.html: %.md
	$(run-pandoc)
endif

.PHONY: html
html: $(files:=.html)

.PHONY: pdf
html: $(files:=.pdf)


.PHONY: editall
editall:
	vim -p $(files:=.Rmd)

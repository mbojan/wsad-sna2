files:=cohesion ergm friendship_paradox local_neighborhoods segregation small_world

pandoc=pandoc
pandoc_flags=-s --toc

define run-pandoc
$(pandoc) $(pandoc_flags) $< -o $@
endef

.PHONY: html
html: $(files:=.html)

%.md: %.Rmd
	Rscript -e "knitr::knit('$<', output='$@')"

%.html: %.md
	$(run-pandoc)

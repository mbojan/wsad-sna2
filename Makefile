# Pliki z częściami
files=local_neighborhoods Centrality friendship_paradox small_world segregation cohesion ergm

pandoc=pandoc
pandoc_flags=

# Jak kompilować?
# 1 = rmarkdown::render()
# 0 = knitr::knit() + pandoc
ifeq ($(use_rmarkdown),)
use_rmarkdown=1
endif

# Format docelowy
ifeq ($(output_format),)
	output_format=html_document
endif


.PHONY: default
default: html


#============================================================================ 
# Recipes

define run-pandoc
$(pandoc) $(pandoc_flags) $^ -o $@
endef


define run-rmarkdown
Rscript -e 'rmarkdown::render("$<", output_format="$(output_format)")'
endef


#============================================================================ 
# Rules

# Jak kompilować
ifeq ($(use_rmarkdown),1) 
$(files:=.pdf): output_format=pdf_document

%.html %.pdf: %.Rmd
	$(run-rmarkdown)
else
$(files:=.html) $(files:=.pdf): pandoc_flags+=-s -S --bibliography=references.bib

%.md: %.Rmd
	Rscript -e "knitr::knit('$<', output='$@')"

%.html: %.md
	$(run-pandoc)
endif

$(files:=.html) $(files:=.pdf): references.bib _output.yaml

$(files:=.pdf): template-wsad.tex



# Wersja książkowa

all.html all.pdf: pandoc_flags=-s -S --number-sections --bibliography=references.bib


all.html all.pdf: local_neighborhoods.md Centrality.md
	$(run-pandoc)


#============================================================================ 
# More tgts

.PHONY: html
html: $(files:=.html)

.PHONY: pdf
html: $(files:=.pdf)

.PHONY: editall
editall:
	vim -p $(files:=.Rmd)

.PHONY: clean
clean:
	rm -rf $(files:=.html) $(files:=.pdf)

# IMPORTANT!
# Do puszczenia po wygenerowaniu HTMLi z opcją w 'self_contained: false' w
# pliku '_output.yaml'!
.PHONY: proof
proof:
	htmlproof . --verbose --ext .html --alt-ignore /figure-html/

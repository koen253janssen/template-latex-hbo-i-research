#  Author:
#       Koen Janssen
#  
#	Copyright:
#		Copyright (c) 2021 Koen Janssen
# 
#	License:
#		GNU General Public License (see http://www.gnu.org/licenses/gpl-3.0.txt)

DOCNAME=apa7

all: build


build:
	-pdflatex $(DOCNAME).tex
	-bibtex $(DOCNAME).aux
	-biber $(DOCNAME).tex
	-pdflatex $(DOCNAME).tex

.PHONY: view
view: build
	-open $(DOCNAME).pdf

.PHONY: onlypdf
onlypdf: build clean
	-open $(DOCNAME).pdf

.PHONY: clean
clean:
	-rm -f *.aux
	-rm -f *.log
	-rm -f *.toc
	-rm -f *.bbl
	-rm -f *.blg
	-rm -f *.out
	-rm -f *.ist
	-rm -f *.hst
	-rm -f *.glo
	-rm -f *.dvi
	-rm -f *.bcf
	-rm -f *.run.xml
	-rm -f *.ver
	-rm -f make/bib

.PHONY: cleanall
cleanall: 
	-find * \( ! -name "*.tex" ! -name "*.bib" ! -name "Makefile" \) -delete
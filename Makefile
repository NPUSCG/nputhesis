all:sample.pdf

sample.pdf: sample.tex ref.bib
	latexmk -xelatex -synctex=1 sample.tex

.PHONY: clean
clean:
	-rm *.pdf *.log *.blg *.bbl *.aux *.fdb_latexmk *.fls *.nlg *.nlo *.nls

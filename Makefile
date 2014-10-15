all:
	latex manual.tex \
	bibtex manual.aux \
	latex manual.tex \
   	dvipdf manual.dvi 

clean:
	rm -f *.log *.aux *.toc *.dvi *.pdf *.bbl *.blg

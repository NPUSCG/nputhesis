all:
	pdflatex manual ; bibtex manual ;\
	pdflatex manual ; pdflatex manual 

clean:
	rm -f *.log *.aux *.toc *.dvi *.pdf *.bbl *.blg

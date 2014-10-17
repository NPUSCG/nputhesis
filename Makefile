all:
	pdflatex manual ; bibtex manual ;\
	pdflatex manual ; pdflatex manual 

clean:
	rm -f *.log *.aux *.toc *.dvi *.bbl *.blg *eps*pdf

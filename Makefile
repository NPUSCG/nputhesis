all:
	xelatex nwpu-cls-manual.tex \
   	dvipdf nwpu-cls-manual.dvi

clean:
	rm -f *.log *.aux *.toc *.dvi *.pdf

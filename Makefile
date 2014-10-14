all:
	xelatex nwpu-cls-manual.tex \
   	dvipdf nwpu-cls-manual.dvi

clean:
	rm *.log *.aux *.toc *.dvi

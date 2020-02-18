del nputhesis.cls nputhesis.pdf
latex nputhesis.ins
xelatex nputhesis.dtx
makeindex -s gglo.ist -o nputhesis.gls nputhesis.glo
makeindex -s gind.ist -o nputhesis.ind nputhesis.idx
xelatex nputhesis.dtx
del nputhesis.gls nputhesis.glo nputhesis.ind nputhesis.idx nputhesis.ilg nputhesis.aux nputhesis.log nputhesis.toc

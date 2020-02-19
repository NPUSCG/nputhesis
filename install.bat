latexmk -xelatex -synctex=1 nputhesis.dtx -r .dtxrc
latexmk -c nputhesis.dtx -r .dtxrc
latexmk -xelatex -synctex=1 nputhesis-sample.tex -r latexmkrc
latexmk -c nputhesis-sample.tex -r latexmkrc
pause
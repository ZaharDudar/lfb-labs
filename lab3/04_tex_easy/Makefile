.PHONY: all clean install uninstall
all:
	make paper.pdf

clean: 
	rm paper.log paper.aux

paper.pdf: paper.tex plot-data.png
	pdflatex paper.tex

plot-%.png: %.dat plot.py
	python3 plot.py -i $*.dat -o $@

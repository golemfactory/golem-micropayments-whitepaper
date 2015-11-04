FILE=main
GRAPHS=geo10.pdf geo100.pdf payments.pdf prob10.pdf prob100.pdf

all: $(FILE).pdf

.PHONY: clean

clean:
	rm -f *.pdf *.aux *.out *.log *.bbl *.blg

$(FILE).pdf: $(FILE).tex $(GRAPHS)
	pdflatex $(FILE)
	pdflatex $(FILE)
	rm -f *.aux *.out *.log *.toc *.bbl *.blg 

geo10.pdf: geo.plt
	gnuplot -e "N = 10" geo.plt

geo100.pdf: geo.plt
	gnuplot -e "N = 100" geo.plt

prob10.pdf: prob.plt
	gnuplot -e "N = 10" prob.plt

prob100.pdf: prob.plt
	gnuplot -e "N = 100" prob.plt

payments.pdf: payments.plt
	gnuplot payments.plt


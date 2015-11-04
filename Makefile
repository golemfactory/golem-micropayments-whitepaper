FILE=main
GRAPHS=geo10.pdf geo100.pdf payments.pdf prob80_10.pdf prob80_100.pdf

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

prob80_10.pdf: prob.plt
	gnuplot -e "R = 0.8" -e "N = 10" prob.plt

prob80_100.pdf: prob.plt
	gnuplot -e "R = 0.8" -e "N = 100" prob.plt

payments.pdf: payments.plt
	gnuplot payments.plt


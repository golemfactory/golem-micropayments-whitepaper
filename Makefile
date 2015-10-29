FILE=main
GRAPHS=geo10.pdf geo100.pdf payments.pdf prob.pdf

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

payments.pdf: payments.plt
	gnuplot payments.plt

prob.pdf: prob.plt
	gnuplot prob.plt

FILE=main
GRAPHS=geo10.pdf geo100.pdf payments.pdf prob10_80_90.pdf prob100_80_90.pdf

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

prob10_80_90.pdf: prob.plt
	gnuplot -e "N = 10" -e "R1 = 0.8" -e "R2 = 0.9" prob.plt

prob100_80_90.pdf: prob.plt
	gnuplot -e "N = 100" -e "R1 = 0.8" -e "R2 = 0.9" prob.plt

payments.pdf: payments.plt
	gnuplot payments.plt


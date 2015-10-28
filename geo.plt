set terminal pdf
set output sprintf("geo%d.pdf", N)

geo(x,p) = p*(1-p)**(x-1)
p = 1.0 / N
unset key
unset label
set style data lines
set title sprintf("Waiting for first prize (%d users in lottery)", N)
set xlabel "number of lotteries"
set ylabel "probability"
set yrange [0.0:(p + 0.2*p)]
plot [0:(5 * (1/p))] geo(x, p) lt -1


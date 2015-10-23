clear
geo(x,p) = p*(1-p)**(x-1)
p = 0.1
unset key
unset label
set style data lines
set title "Waiting for first prize (10 users in lottery)"
set xlabel "number of lotteries"
set ylabel "probability"
set yrange [0.0:(p + 0.2*p)]
plot [0:(5 * (1/p))] geo(x, p) lt -1
set output "geo.pdf"
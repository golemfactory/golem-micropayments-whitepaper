# requires parameter N (number of lottery participants)
# example: gnuplot -e "N = 10" prob.plt

set terminal pdf
set output sprintf("prob%d.pdf", N)

isint(x)=(int(x)==x)
binom(x,n,p)=exp(lgamma(n+1)-lgamma(n-x+1)-lgamma(x+1)  +x*log(p)+(n-x)*log(1.0-p))
cbinom(x, n, p)=(x<1)?binom(0, n, p):binom(x, n, p)+cbinom(x-1, n, p)

unset key
unset label
set style data lines
set title sprintf("Chances of receiving at least 80%% of expected income (%d users in lottery)", N)
set xlabel "number of lotteries"
set ylabel "probability"
set yrange [0.5:1.0]

p = 1.0 / N
l = 6.5 * N
h = 50 * N
plot [l:h] 1-cbinom(x * p *0.8, x, p) + binom(x*p*0.8, x, p) lt -1

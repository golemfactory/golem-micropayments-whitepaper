# parameters:
#   N (number of lottery participants)
#   R1, R2 (desired outcome, as rate of expected value)
# example: gnuplot -e "N = 10" -e "R1 = 0.8" -e "R2 = 0.9" prob.plt

set terminal pdf
set output sprintf("prob%d_%d_%d.pdf", N, 100 * R1, 100 * R2)

isint(x)=(int(x)==x)
binom(x,n,p)=exp(lgamma(n+1)-lgamma(n-x+1)-lgamma(x+1)  +x*log(p)+(n-x)*log(1.0-p))
cbinom(x, n, p)=(x<1)?binom(0, n, p):binom(x, n, p)+cbinom(x-1, n, p)

unset key
unset label
set style data lines
set key bottom right box

set title sprintf("Chances of receiving a specified fraction of expected income (%d users in lottery)", N)
set xlabel "number of lotteries"
set ylabel "probability"
set yrange [0.5:1.0]

p = 1.0 / N
l = 7.0 * N
h = 150 * N
plot [l:h] 1-cbinom(x * p * R1, x, p) + binom(x * p * R1, x, p) lt 0 \
           title sprintf("chance of receiving at least %d%% of expected value", R1 * 100), \
     	   1-cbinom(x * p * R2, x, p) + binom(x * p * R2, x, p) lt -1 \
	   title sprintf("chance of receiving at least %d%% of expected value", R2 * 100)
	   

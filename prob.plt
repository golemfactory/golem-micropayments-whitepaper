set terminal pdf
set output "prob.pdf"

isint(x)=(int(x)==x)
binom(x,n,p)=exp(lgamma(n+1)-lgamma(n-x+1)-lgamma(x+1)  +x*log(p)+(n-x)*log(1.0-p))
#cbinom(x,n,p)=ibeta(n-x,x+1.0,1.0-p)
cbinom(x, n, p)=(x<1)?binom(0, n, p):binom(x, n, p)+cbinom(x-1, n, p)
p = 0.01
prct = 0.8
unset key
unset label
set style data lines
set title sprintf("Chances of receiving at least %d% of expected income", prct*100).sprintf(" (%d users in lottery)", ceil(1.0 / p))
set xlabel "number of lotteries"
set ylabel "probability"
set yrange [0.0:1.0]
plot [6.5 * ceil(1.0 / p) : 50 * ceil(1.0 / p)] 1-cbinom(x * p * prct, x, p) + binom(x * p * prct, x, p) lt -1

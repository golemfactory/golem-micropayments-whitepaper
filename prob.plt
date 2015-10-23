clear
isint(x)=(int(x)==x)
binom(x,n,p)=exp(lgamma(n+1)-lgamma(n-x+1)-lgamma(x+1)  +x*log(p)+(n-x)*log(1.0-p))
#cbinom(x,n,p)=ibeta(n-x,x+1.0,1.0-p)
cbinom(x, n, p)=(x<1)?binom(0, n, p):binom(x, n, p)+cbinom(x-1, n, p)
p = 0.1
unset key
unset label
set style data lines
set title "Chances of receiving at least 80% of expected income (10 users in lottery)"
set xlabel "number of lotteries"
set ylabel "probability"
set yrange [0.0:1.0]
set output "prob.pdf"
plot [65:500] 1-cbinom(x * p *0.8, x, 0.1) + binom(x*p*0.8, x, 0.1) lt -1

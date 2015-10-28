set terminal pdf
set output "payments.pdf"

log2(x) = log(x)/log(2)
T = 21000
I = 2176
V = 9000
SM = 5000
SC = 20000
H = 222
batch(n) = T + n*(I + V)
subaccount(n) = T + n*(I + SM)
check(n) = T + I + 2*SC + T + I + SM + V + T + 5 * I + log2(n)* ((33/32)*I + 2 * H)  + 0.5 * V
winner(n) = T + I + 2*SC + T + I + SM + V + T + I + SM + T + I + 0.5 * V
set key left box
set style func linespoints
set title "Payment method cost"
set xlabel "number of users"
set ylabel "gas used"
set yrange [0.0:600000.0]
set format y "%.0s%c"
plot [0:40] batch(x) lt -1 pi -6 pt 7 title "batch", \
            subaccount(x) lt -1 pi -4 pt 6 title "subaccount", \
            check(x) lt -1 title "lottery check", \
            winner(x) lt -1  pi -5 pt 5  title "lottery winner"



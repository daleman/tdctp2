set terminal png

set output "tokyo_congestion.png"
plot "www.u-tokyo.ac.jp_congestion.dat"

set output "sydney_congestion.png"
plot "sydney.edu.au_congestion.dat"

set output "saopaulo_congestion.png"
plot "www5.usp.br_congestion.dat"

set output "india_congestion.png"
plot "www.iitkgp.ac.in_congestion.dat"

set output "milan_congestion.png"
plot "www.unimi.it_congestion.dat"


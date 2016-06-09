set terminal png
set output "congestion.png"
set xdata time
set timefmt "%H:%M"
set format x "%H:%M"
set key bottom

plot "www.iitkgp.ac.in_congestion.dat" using 1:2 w linespoint title 'India', \
  "sydney.edu.au_congestion.dat" using 1:2 w linespoint title 'Sydney', \
  "www.u-tokyo.ac.jp_congestion.dat" using 1:2 w linespoint title 'Tokyo', \
  "www.unimi.it_congestion.dat" using 1:2 w linespoint title 'Milán', \
  "www5.usp.br_congestion.dat" using 1:2 w linespoint title 'São Paulo'

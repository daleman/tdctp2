
	set terminal png size 1920,1080 background rgb "#aaaaff"
	set output "www.u-tokyo.ac.jp13_09.png"
	set size 1,1
	 
	plot "world.dat" with filledcurves ls 1 lc rgb "#aaffaa", 		"" with l ls 2, 		"www.u-tokyo.ac.jp13_09.cor" with linespoint pt 7 lc rgb "black" lw 2
	
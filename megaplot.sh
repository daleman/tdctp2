mkdir tokyo
FILES=www.u-tokyo.ac.jp*.cor
S='''set terminal png size 1920,1080 background rgb "#aaaaff"\nset output "mega_tokyo.png"\nset size 1,1\n\nplot "world.dat" with filledcurves ls 1 lc rgb "#aaffaa", \ \n  "" with l ls 2'''
for f in $FILES
do
	T=", \ \n  \"$f\" with linespoint pt 7 lw 2"
	S="$S$T"
	mv $f tokyo/$f
done

echo $S >> tokyo/mega_tokyo.gnuplot

mkdir india
FILES=www.iitkgp.ac.in*.cor
S='''set terminal png size 1920,1080 background rgb "#aaaaff"\nset output "mega_india.png"\nset size 1,1\n\nplot "world.dat" with filledcurves ls 1 lc rgb "#aaffaa", \ \n  "" with l ls 2'''
for f in $FILES
do
	T=", \ \n  \"$f\" with linespoint pt 7 lw 2"
	S="$S$T"
	mv $f india/$f
done

echo $S >> india/mega_india.gnuplot

mkdir sydney
FILES=sydney.edu.au*.cor
S='''set terminal png size 1920,1080 background rgb "#aaaaff"\nset output "mega_sydney.png"\nset size 1,1\n\nplot "world.dat" with filledcurves ls 1 lc rgb "#aaffaa", \ \n  "" with l ls 2'''
for f in $FILES
do
	T=", \ \n  \"$f\" with linespoint pt 7 lw 2"
	S="$S$T"
	mv $f sydney/$f
done

echo $S >> sydney/mega_sydney.gnuplot

mkdir milan
FILES=www.unimi.it*.cor
S='''set terminal png size 1920,1080 background rgb "#aaaaff"\nset output "mega_milan.png"\nset size 1,1\n\nplot "world.dat" with filledcurves ls 1 lc rgb "#aaffaa", \ \n  "" with l ls 2'''
for f in $FILES
do
	T=", \ \n  \"$f\" with linespoint pt 7 lw 2"
	S="$S$T"
	mv $f milan/$f
done

echo $S >> milan/mega_milan.gnuplot

mkdir saopaulo
FILES=www5.usp.br*.cor
S='''set terminal png size 1920,1080 background rgb "#aaaaff"\nset output "mega_saopaulo.png"\nset size 1,1\n\nplot "world.dat" with filledcurves ls 1 lc rgb "#aaffaa", \ \n  "" with l ls 2'''
for f in $FILES
do
	T=", \ \n  \"$f\" with linespoint pt 7 lw 2"
	S="$S$T"
	mv $f saopaulo/$f
done

echo $S >> saopaulo/mega_saopaulo.gnuplot

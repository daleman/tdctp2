#Muevo los archivos
FILES=www.u-tokyo.ac.jp*.gnuplot
for f in $FILES
do
	git mv $f tokyo/$f
done
FILES=www.iitkgp.ac.in*.gnuplot
for f in $FILES
do
	git mv $f india/$f
done
FILES=sydney.edu.au*.gnuplot
for f in $FILES
do
	git mv $f sydney/$f
done
FILES=www.unimi.it*.gnuplot
for f in $FILES
do
	git mv $f milan/$f
done
FILES=www5.usp.br*.gnuplot
for f in $FILES
do
	git mv $f saopaulo/$f
done
FILES=www.u-tokyo.ac.jp*.cor
for f in $FILES
do
	git mv $f tokyo/$f
done
FILES=www.iitkgp.ac.in*.cor
for f in $FILES
do
	git mv $f india/$f
done
FILES=sydney.edu.au*.cor
for f in $FILES
do
	git mv $f sydney/$f
done
FILES=www.unimi.it*.cor
for f in $FILES
do
	git mv $f milan/$f
done
FILES=www5.usp.br*.cor
for f in $FILES
do
	git mv $f saopaulo/$f
done

#Genero los GNUplots (Tokyo)
cd tokyo
FILES=www.u-tokyo.ac.jp*.cor
S='''set terminal png size 1920,1080 background rgb "#aaaaff"\nset output "mega_tokyo.png"\nset size 1,1\nset key out\nplot "world.dat" with filledcurves ls 1 lc rgb "#aaffaa" title "", \\\n  "" with l ls 2 title ""'''
for f in $FILES
do
	T=''', \\\n  "'''
	S="$S$T$f\" with linespoint pt 7 lw 2"
done
echo $S > mega_tokyo.gnuplot
cd ..

#Genero los GNUplots (India)
cd india
FILES=www.iitkgp.ac.in*.cor
S='''set terminal png size 1920,1080 background rgb "#aaaaff"\nset output "mega_india.png"\nset size 1,1\nset key out\nplot "world.dat" with filledcurves ls 1 lc rgb "#aaffaa" title "", \\\n  "" with l ls 2 title ""'''
for f in $FILES
do
	T=''', \\\n  "'''
	S="$S$T$f\" with linespoint pt 7 lw 2"
done
echo $S > mega_india.gnuplot
cd ..

#Genero los GNUplots (Sydney)
cd sydney
FILES=sydney.edu.au*.cor
S='''set terminal png size 1920,1080 background rgb "#aaaaff"\nset output "mega_sydney.png"\nset size 1,1\nset key out\nplot "world.dat" with filledcurves ls 1 lc rgb "#aaffaa" title "", \\\n  "" with l ls 2 title ""'''
for f in $FILES
do
	T=''', \\\n  "'''
	S="$S$T$f\" with linespoint pt 7 lw 2"
done
echo $S > mega_sydney.gnuplot
cd ..

#Genero los GNUplots (Milán)
cd milan
FILES=www.unimi.it*.cor
S='''set terminal png size 1920,1080 background rgb "#aaaaff"\nset output "mega_milan.png"\nset size 1,1\nset key out\nplot "world.dat" with filledcurves ls 1 lc rgb "#aaffaa" title "", \\\n  "" with l ls 2 title ""'''
for f in $FILES
do
	T=''', \\\n  "'''
	S="$S$T$f\" with linespoint pt 7 lw 2"
done
echo $S > mega_milan.gnuplot
cd ..

#Genero los GNUplots (Sao Paulo)
cd saopaulo
FILES=www5.usp.br*.cor
S='''set terminal png size 1920,1080 background rgb "#aaaaff"\nset output "mega_saopaulo.png"\nset size 1,1\nset key out\nplot "world.dat" with filledcurves ls 1 lc rgb "#aaffaa" title "", \\\n  "" with l ls 2 title ""'''
for f in $FILES
do
	T=''', \\\n  "'''
	S="$S$T$f\" with linespoint pt 7 lw 2"
done
echo $S > mega_saopaulo.gnuplot
cd ..

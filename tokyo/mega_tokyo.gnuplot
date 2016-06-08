set terminal png size 1920,1080 background rgb "#aaaaff"
set output "mega_tokyo.png"
set size 1,1

plot "world.dat" with filledcurves ls 1 lc rgb "#aaffaa", \ 
 "" with l ls 2, \ 
 "www.u-tokyo.ac.jp00_01.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp00_25.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp00_34.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp00_42.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp00_53.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp01_06.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp01_25.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp01_35.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp01_45.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp01_54.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp02_10.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp02_21.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp03_02.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp03_18.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp03_31.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp03_40.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp03_51.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp04_01.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp04_12.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp04_35.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp04_45.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp05_09.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp05_20.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp05_28.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp05_38.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp05_45.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp05_53.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp06_02.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp06_22.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp06_31.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp06_43.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp06_54.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp07_25.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp07_37.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp07_44.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp07_53.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp08_05.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp08_17.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp08_42.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp08_52.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp09_03.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp09_16.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp09_48.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp10_11.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp10_22.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp10_55.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp11_07.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp11_29.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp23_11.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp23_31.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp23_39.cor" with linespoint pt 7 lw 2, \ 
 "www.u-tokyo.ac.jp23_51.cor" with linespoint pt 7 lw 2

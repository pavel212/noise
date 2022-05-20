set terminal pngcairo size 1536,1536 fontscale 2 enhanced dashed
set size square
set output "integrators.png"

#set colorsequence classic

set multiplot

set lmargin at screen 0.1
set rmargin at screen 0.95
set tmargin at screen 0.95
set bmargin at screen 0.1
                         
set logscale xy
set key at 9e-3,9e-4 box title "Voltmeters"
set format "10^{%T}"
set grid xtics back ytics back mxtics back mytics back lc rgb 'black' lt 1, lc rgb 'gray' lt 1 

x0 = 1e-6
x1 = 1e3
y0 = 1e-12
y1 = 1e-3
set xrange[x0:x1]
set yrange[y0:y1]
set xlabel "Integration time, sec"
set ylabel "Noise, V*sec"

En=4.0694E-9

#set label 1 "60{/Symbol W}=1nV/{/Symbol \326}Hz"   at 1.1e-4,1.5e-11 rotate by 26.6 
#set label 2 "1k{/Symbol W}=4nV/{/Symbol \326}Hz"   at 2e-5,3e-11 rotate by 26.6 
#set label 3 "10k{/Symbol W}=13nV/{/Symbol \326}Hz" at 5e-6,4.5e-11 rotate by 26.6 
#set label 4 "100k{/Symbol W}=40nV/{/Symbol \326}Hz" at 1.5e-6,7e-11 rotate by 26.6 

set label "60{/Symbol W}=1nV/{/Symbol \326}Hz"    at 1.5e-6,7e-11/sqrt(100000/60) rotate by 26.6 
set label "1k{/Symbol W}=4nV/{/Symbol \326}Hz"    at 1.5e-6,7e-11/sqrt(100) rotate by 26.6 
set label "10k{/Symbol W}=13nV/{/Symbol \326}Hz"  at 1.5e-6,7e-11/sqrt(10) rotate by 26.6 
set label "100k{/Symbol W}=40nV/{/Symbol \326}Hz" at 1.5e-6,7e-11 rotate by 26.6 

set label "10nV" at 0.8*1e-4,1e-12/0.8 rotate by 45 textcolor rgb 'red'
set label "1nV" at 0.8*1e-3,1e-12/0.8 rotate by 45 textcolor rgb 'red'
set label "0.1nV" at 0.8*1e-2,1e-12/0.8 rotate by 45 textcolor rgb 'red'


plot \
'VsDC3.dat'every::1 with lines lw 2 title "VsDC3, 200mV",\
'Keithley2182A.dat' using 1:3 every::1 with lines lw 2 title "Keithley 2182A, 10mV",\
'HP3458A.dat' using 1:3 every::1 with lines lw 2 title "Agilent 3458A, 100mV",\
'NVM.dat' every::1 with lines lw 3 title "NMV",\
'Lakeshore480.dat' every::1 with lines lw 2 title "Lakeshore 480",\
'PDI5025.dat' every::1 with lines lw 2 title "PDI5025, G=1000",\
'ADS1232.dat' every::1 with lines lw 2 title "ADS1232REF, 40mV",\
'AD7195.dat' every::1 with lines lw 2 title "AD7195EBZ, 40mV",\
'ADS1263.dat' using 1:2 every::1 with lines lw 5 title "ADS1263, 40mV",\
'ADS1263.dat' using 1:3 every::1 with lines lw 5 title "7 x ADS1263, 40mV",\
En*sqrt(x*60/1000) lc rgb 'black' dt 2 notitle,\
En*sqrt(x*1e3/1000) lc rgb 'black' dt 2 notitle,\
En*sqrt(x*1e4/1000) lc rgb 'black' dt 2 notitle,\
En*sqrt(x*1e5/1000) lc rgb 'black' dt 2 notitle,\
x*1e-8 lc rgb 'red' dt 2 notitle,\
x*1e-9 lc rgb 'red' dt 2 notitle,\
x*1e-10 lc rgb 'red' dt 2 notitle

set key opaque at 9,9e-4 box title "Amplifiers" 
unset grid

plot \
'Ectron428-O.dat' every::1 with linespoints lw 1 title "Ectron 428-O",\
'LT1028.dat' with linespoints lw 1 title "LT1024",\
'SSM2212.dat' with linespoints lw 1 title "SSM2212",\
'ADA4528.dat' with linespoints lw 1 title "ADA4528",\
'ADA4528x10.dat' with linespoints lw 1 title "10 x ADA4528"


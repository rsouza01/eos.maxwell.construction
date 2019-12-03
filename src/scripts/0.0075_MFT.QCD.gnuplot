#!/usr/bin/gnuplot

set macro

reset

# Settings for all plots
set datafile separator ","

set encoding iso
set terminal postscript eps enhanced font "cmr10"
set lmargin 10
unset grid

set output "../plots/MFT.QCD.0.0075.eps"

#PLOT 1 - TODAS EOS - epsilon x pressure


#set output "../plots/MFT.QCD.epsilon_P.0.0075.eps"

set key left box linestyle -1

set xrange[0:6000]
set yrange[0:]

set title 'Eqs. de Estado, {/Symbol e} {/Symbol \264} P'
set xlabel '{/Symbol e} [MeV fm^{-3}]' font "cmr10,15"
set ylabel 'Pressure [MeV fm^{-3}]' font "cmr10,15"

plot "../workspace/eos.sly4/sly4.dat.NUC.csv" using 1:2 with lines lt rgb "blue" title "Sly4", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_70_XI_0.0075.FULL.NUC.csv" using 1:2 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_80_XI_0.0075.FULL.NUC.csv" using 1:2 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_90_XI_0.0075.FULL.NUC.csv" using 1:2 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_100_XI_0.0075.FULL.NUC.csv" using 1:2 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0075"

#PLOT 2 - TODAS EOS - mu x pressure

#set output "../plots/MFT.QCD.mu_P.0.0075.eps"

set multiplot

#set key left box linestyle -1
set key right bottom box linestyle -1

unset grid

set xrange[500:3000]
set yrange[0:]

set xlabel '{/Symbol m} [MeV]' font "cmr10,15"
set ylabel 'Pressure [MeV fm^{-3}]' font "cmr10,15"

set title 'Eqs. de Estado, {/Symbol m} {/Symbol \264} P'

set arrow from 2350,1500 to 2030,1515 lw 1 back filled

set arrow from 2350,1200 to 2750,1200 lw 1 front nohead
set arrow from 2750,1200 to 2750,1800 lw 1 front nohead
set arrow from 2750,1800 to 2350,1800 lw 1 front nohead
set arrow from 2350,1800 to 2350,1200 lw 1 front nohead

plot "../workspace/eos.sly4/sly4.dat.NUC.csv" using 4:2 with lines lt rgb "black" title "Sly4", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_70_XI_0.0075.FULL.NUC.csv" using 4:2 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_80_XI_0.0075.FULL.NUC.csv" using 4:2 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_90_XI_0.0075.FULL.NUC.csv" using 4:2 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_100_XI_0.0075.FULL.NUC.csv" using 4:2 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0075"

#Small plot
unset key
unset xlabel
unset ylabel
unset label
unset arrow
set grid
#set tics scale 0.5 front
#set xtics 10 offset 0,0.5
set xtics 100
set ytics 200

set title 'Zoom, {/Symbol m}_{Sly4} = {/Symbol m}_{MFT QCD} '

set origin 0.07,0.45
set size 0.6,0.3
set xrange[2350:2750]
set yrange[1200:1800]

plot "../workspace/eos.sly4/sly4.dat.NUC.csv" using 4:2 with lines lt rgb "black" title "Sly4", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_70_XI_0.0075.FULL.NUC.csv" using 4:2 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_80_XI_0.0075.FULL.NUC.csv" using 4:2 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_90_XI_0.0075.FULL.NUC.csv" using 4:2 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_100_XI_0.0075.FULL.NUC.csv" using 4:2 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0075"


#PLOT 3 - TODAS EOS - n x epsilon

reset
unset multiplot
unset origin
unset xrange
unset yrange
set xrange[0:3000]
#set yrange[0:2500]

#set output "../plots/MFT.QCD.n_epsilon.0.0075.eps"

set key left center box linestyle -1

set title 'Eqs. de Estado, {/Symbol m} {/Symbol \264} n'

set ylabel 'n [fm^{-3}]' font "cmr10,15"
set xlabel '{/Symbol m} [MeV]' font "cmr10,15"


plot "../workspace/eos.sly4/sly4.dat.NUC.csv" using 4:3 with lines lt rgb "blue" title "Sly4", \
    0.16 with lines lt rgb "red" title "n_0", \
    1.6 with lines lt rgb "red" title "10 n_0", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_70_XI_0.0075.FULL.NUC.csv" using 4:3 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_80_XI_0.0075.FULL.NUC.csv" using 4:3 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_90_XI_0.0075.FULL.NUC.csv" using 4:3 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_100_XI_0.0075.FULL.NUC.csv" using 4:3 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0075"

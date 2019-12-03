#!/usr/bin/gnuplot

reset

# Settings for all plots
set datafile separator ","

set encoding iso
set terminal postscript eps enhanced font "cmr10"
set lmargin 10
set grid

# Settings for Plot 1

set output "../plots/QCD_IRE_epsilon_pressure.eps"

set key left box linestyle -1

#set xrange[0:2000]
#set yrange[0:1500]

set xlabel '{/Symbol e} [MeV fm^{-3}]' font "cmr10,15"
set ylabel 'Pressure [MeV fm^{-3}]' font "cmr10,15"

set title 'QCD IRE, {/Symbol e} {/Symbol \264} P'

plot "../eos.qcd.ire/qcd.ire.eos.UDS.NUC.csv" using 1:2 with lines lt rgb "red" title "QCD IRE", \
    "../eos.sly4/sly4.dat.NUC.csv" using 1:2 with lines lt rgb "blue" title "Sly4"
 


# Settings for Plot 2

set output "../plots/QCD_IRE_mu_pressure.eps"

set key left box linestyle -1

#set xrange[0:2000]
set yrange[0:]

set xlabel '{/Symbol m} [MeV]' font "cmr10,15"
set ylabel 'Pressure [MeV fm^{-3}]' font "cmr10,15"

set title 'QCD IRE, {/Symbol m} {/Symbol \264} P'

plot "../eos.qcd.ire/qcd.ire.eos.UDS.NUC.csv" using 4:2 with lines lt rgb "red" title "QCD IRE", \
    "../eos.sly4/sly4.dat.NUC.csv" using 1:2 with lines lt rgb "blue" title "Sly4"

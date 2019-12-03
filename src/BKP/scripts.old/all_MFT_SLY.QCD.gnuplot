#!/usr/bin/gnuplot

reset

# Settings for all plots
set datafile separator ","

set encoding iso
set terminal postscript eps enhanced font "cmr10"
set lmargin 10
set grid

# Settings for Plot 1

set output "../plots/MFT.QCD.Sly4.NUC.eps"

set key left box linestyle -1

set xrange[0:100]
set yrange[0:]

set xlabel '{/Symbol e} [MeV fm^{-3}]' font "cmr10,15"
set ylabel 'Pressure [MeV fm^{-3}]' font "cmr10,15"

set title 'Hybrid EoS, {/Symbol e} {/Symbol \264} P'

plot "../eos.MFT.QCD.SLY4/MFT.QCD.B_80_XI_0.003_SLY4.NUC.csv" using 2:1 with lines lt rgb "red" title "B=80 MeV, {/Symbol x}=0.0030", \
    "../eos.MFT.QCD.SLY4/MFT.QCD.B_90_XI_0.0015_SLY4.NUC.csv" using 2:1 with lines lt rgb "red" title "B=90 MeV, {/Symbol x}=0.0015", \
    "../eos.MFT.QCD.SLY4/MFT.QCD.B_100_XI_0.0015_SLY4.NUC.csv" using 2:1 with lines lt rgb "red" title "B=100 MeV, {/Symbol x}=0.0015"
#    "../eos.MFT.QCD.SLY4/MFT.QCD.B_90_XI_0.003_SLY4.NUC.csv" using 2:1 with lines lt rgb "red" title "B=90 MeV, {/Symbol x}=0.0030"

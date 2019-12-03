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

#set xrange[0:100]
#set yrange[0:]

set ylabel '{/Symbol e} [MeV fm^{-3}]' font "cmr10,15"
set xlabel 'Pressure [MeV fm^{-3}]' font "cmr10,15"

set title 'Hybrid EoS, {/Symbol e} {/Symbol \264} P'

plot "../workspace/eos.mft.qcd.sly4/SLY4_MFT.QCD.B_70_XI_0.0075.FULL.NUC.csv" using 2:1 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0075"

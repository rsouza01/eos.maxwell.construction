#!/usr/bin/gnuplot

set macro

reset

# Settings for all plots
set datafile separator ","

set encoding iso
set terminal postscript eps enhanced font "cmr10"
set lmargin 10
set grid

set output "../plots/MFT.QCD.eps"

#PLOT 1 - TODAS EOS - epsilon x pressure


#set output "../plots/MFT.QCD.epsilon_P.eps"

set key left box linestyle -1

set xrange[0:6000]
set yrange[0:]

set title 'Eqs. de Estado, {/Symbol r} {/Symbol \264} P'
set xlabel '{/Symbol r} [MeV fm^{-3}]' font "cmr10,15"
set ylabel 'Pressure [MeV fm^{-3}]' font "cmr10,15"

plot "../workspace/eos.sly4/sly4.dat.NUC.csv" using 1:2 with lines lt rgb "blue" title "Sly4", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_70_XI_0.003.FULL.NUC.csv" using 1:2 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0030", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_70_XI_0.0045.FULL.NUC.csv" using 1:2 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0045", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_70_XI_0.006.FULL.NUC.csv" using 1:2 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0060", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_70_XI_0.0075.FULL.NUC.csv" using 1:2 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_80_XI_0.0015.FULL.NUC.csv" using 1:2 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0015", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_80_XI_0.003.FULL.NUC.csv" using 1:2 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0030", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_80_XI_0.0045.FULL.NUC.csv" using 1:2 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0045", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_80_XI_0.006.FULL.NUC.csv" using 1:2 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0060", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_80_XI_0.0075.FULL.NUC.csv" using 1:2 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_90_XI_0.0015.FULL.NUC.csv" using 1:2 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0015", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_90_XI_0.003.FULL.NUC.csv" using 1:2 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0030", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_90_XI_0.0045.FULL.NUC.csv" using 1:2 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0045", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_90_XI_0.006.FULL.NUC.csv" using 1:2 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0060", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_90_XI_0.0075.FULL.NUC.csv" using 1:2 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_100_XI_0.0015.FULL.NUC.csv" using 1:2 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0015", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_100_XI_0.003.FULL.NUC.csv" using 1:2 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0030", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_100_XI_0.0045.FULL.NUC.csv" using 1:2 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0045", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_100_XI_0.006.FULL.NUC.csv" using 1:2 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0060", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_100_XI_0.0075.FULL.NUC.csv" using 1:2 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0075"

#PLOT 2 - TODAS EOS - mu x pressure

#set output "../plots/MFT.QCD.mu_P.eps"

set key left box linestyle -1

set xrange[400:4000]
set yrange[0:]

set xlabel '{/Symbol m} [MeV]' font "cmr10,15"
set ylabel 'Pressure [MeV fm^{-3}]' font "cmr10,15"

set title 'Eqs. de Estado, {/Symbol m} {/Symbol \264} P'

set label 1 at   500, 1000 '{/Symbol x}=0.0015' font "cmr10,15"
set label 2 at  1500, 2000 '{/Symbol x}=0.0030' font "cmr10,15"
set label 3 at  2500, 3600 '{/Symbol x}=0.0045' font "cmr10,15"
set label 4 at  3000, 3300 '{/Symbol x}=0.0060' font "cmr10,15"
set label 5 at  3000, 2150 '{/Symbol x}=0.0075' font "cmr10,15"
# set arrow from 3000,2000 to 2950,2150 nohead

plot "../workspace/eos.sly4/sly4.dat.NUC.csv" using 4:2 with lines lt rgb "blue" title "Sly4", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_70_XI_0.003.FULL.NUC.csv" using 4:2 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0030", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_70_XI_0.0045.FULL.NUC.csv" using 4:2 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0045", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_70_XI_0.006.FULL.NUC.csv" using 4:2 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0060", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_70_XI_0.0075.FULL.NUC.csv" using 4:2 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_80_XI_0.0015.FULL.NUC.csv" using 4:2 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0015", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_80_XI_0.003.FULL.NUC.csv" using 4:2 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0030", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_80_XI_0.0045.FULL.NUC.csv" using 4:2 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0045", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_80_XI_0.006.FULL.NUC.csv" using 4:2 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0060", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_80_XI_0.0075.FULL.NUC.csv" using 4:2 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_90_XI_0.0015.FULL.NUC.csv" using 4:2 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0015", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_90_XI_0.003.FULL.NUC.csv" using 4:2 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0030", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_90_XI_0.0045.FULL.NUC.csv" using 4:2 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0045", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_90_XI_0.006.FULL.NUC.csv" using 4:2 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0060", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_90_XI_0.0075.FULL.NUC.csv" using 4:2 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_100_XI_0.0015.FULL.NUC.csv" using 4:2 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0015", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_100_XI_0.003.FULL.NUC.csv" using 4:2 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0030", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_100_XI_0.0045.FULL.NUC.csv" using 4:2 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0045", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_100_XI_0.006.FULL.NUC.csv" using 4:2 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0060", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_100_XI_0.0075.FULL.NUC.csv" using 4:2 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0075"

#PLOT 3 - TODAS EOS - n x epsilon

reset

#set xrange[0:1.5]
#set yrange[0:2500]

#set output "../plots/MFT.QCD.n_epsilon.eps"

set key right bottom box linestyle -1

set title 'Eqs. de Estado, {/Symbol m} {/Symbol \264} n'

set ylabel 'n [fm^{-3}]' font "cmr10,15"
set xlabel '{/Symbol m} [MeV]' font "cmr10,15"


plot "../workspace/eos.sly4/sly4.dat.NUC.csv" using 4:3 with lines lt rgb "blue" title "Sly4", \
    0.16 with lines lt rgb "red" title "n_0", \
    1.6 with lines lt rgb "red" title "10 n_0", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_70_XI_0.003.FULL.NUC.csv" using 4:3 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0030", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_70_XI_0.0045.FULL.NUC.csv" using 4:3 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0045", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_70_XI_0.006.FULL.NUC.csv" using 4:3 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0060", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_70_XI_0.0075.FULL.NUC.csv" using 4:3 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_80_XI_0.0015.FULL.NUC.csv" using 4:3 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0015", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_80_XI_0.003.FULL.NUC.csv" using 4:3 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0030", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_80_XI_0.0045.FULL.NUC.csv" using 4:3 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0045", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_80_XI_0.006.FULL.NUC.csv" using 4:3 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0060", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_80_XI_0.0075.FULL.NUC.csv" using 4:3 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_90_XI_0.0015.FULL.NUC.csv" using 4:3 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0015", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_90_XI_0.003.FULL.NUC.csv" using 4:3 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0030", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_90_XI_0.0045.FULL.NUC.csv" using 4:3 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0045", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_90_XI_0.006.FULL.NUC.csv" using 4:3 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0060", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_90_XI_0.0075.FULL.NUC.csv" using 4:3 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_100_XI_0.0015.FULL.NUC.csv" using 4:3 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0015", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_100_XI_0.003.FULL.NUC.csv" using 4:3 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0030", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_100_XI_0.0045.FULL.NUC.csv" using 4:3 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0045", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_100_XI_0.006.FULL.NUC.csv" using 4:3 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0060", \
    "../workspace/eos.mft.qcd/MFT.QCD.B_100_XI_0.0075.FULL.NUC.csv" using 4:3 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0075"

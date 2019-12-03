#!/usr/bin/gnuplot

set macro

reset

# Settings for all plots
set datafile separator ","

set encoding iso
set terminal postscript eps enhanced font "cmr10"
set lmargin 10
set grid

# Settings for Plot 1

set output "../plots/MFT.QCD.B_70.eps"

set key left box linestyle -1

set xrange[0:6000]
set yrange[0:]

set xlabel '{/Symbol r} [MeV fm^{-3}]' font "cmr10,15"
set ylabel 'Pressure [MeV fm^{-3}]' font "cmr10,15"

set title 'MFT QCD, B=70 MeV, {/Symbol r} {/Symbol \264} P'

plot "../workspace/eos.sly4/sly4.dat.NUC.csv" using 1:2 with lines lt rgb "blue" title "Sly4", \
    "../workspace/eos.bps/bps-negele-wiringa.csv" using 1:2 with lines lt rgb "black" title "BPS Negele - Wiringa", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_70_XI_0.003.FULL.NUC.csv" using 1:2 with lines lt rgb "red" title "{/Symbol x}=0.0030", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_70_XI_0.0045.FULL.NUC.csv" using 1:2 with lines lt rgb "red" title "{/Symbol x}=0.0045", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_70_XI_0.006.FULL.NUC.csv" using 1:2 with lines lt rgb "red" title "{/Symbol x}=0.0060", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_70_XI_0.0075.FULL.NUC.csv" using 1:2 with lines lt rgb "red" title "{/Symbol x}=0.0075"

# Settings for Plot 2

set output "../plots/MFT.QCD.B_80.eps"

set key left box linestyle -1

set xrange[0:6000]
set yrange[0:]

set xlabel '{/Symbol r} [MeV fm^{-3}]' font "cmr10,15"
set ylabel 'Pressure [MeV fm^{-3}]' font "cmr10,15"

set title 'MFT QCD, B=80 MeV, {/Symbol r} {/Symbol \264} P'

plot "../workspace/eos.sly4/sly4.dat.NUC.csv" using 1:2 with lines lt rgb "blue" title "Sly4", \
    "../workspace/eos.bps/bps-negele-wiringa.csv" using 1:2 with lines lt rgb "black" title "BPS Negele - Wiringa", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_80_XI_0.0015.FULL.NUC.csv" using 1:2 with lines lt rgb "orange" title "{/Symbol x}=0.0015", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_80_XI_0.003.FULL.NUC.csv" using 1:2 with lines lt rgb "orange" title "{/Symbol x}=0.0030", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_80_XI_0.0045.FULL.NUC.csv" using 1:2 with lines lt rgb "orange" title "{/Symbol x}=0.0045", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_80_XI_0.006.FULL.NUC.csv" using 1:2 with lines lt rgb "orange" title "{/Symbol x}=0.0060", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_80_XI_0.0075.FULL.NUC.csv" using 1:2 with lines lt rgb "orange" title "{/Symbol x}=0.0075"

# Settings for Plot 3

set output "../plots/MFT.QCD.B_90.eps"

set key left box linestyle -1

set xrange[0:6000]
set yrange[0:]

set xlabel '{/Symbol r} [MeV fm^{-3}]' font "cmr10,15"
set ylabel 'Pressure [MeV fm^{-3}]' font "cmr10,15"

set title 'MFT QCD, B=90 MeV, {/Symbol r} {/Symbol \264} P'

plot "../workspace/eos.sly4/sly4.dat.NUC.csv" using 1:2 with lines lt rgb "blue" title "Sly4", \
    "../workspace/eos.bps/bps-negele-wiringa.csv" using 1:2 with lines lt rgb "black" title "BPS Negele - Wiringa", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_90_XI_0.0015.FULL.NUC.csv" using 1:2 with lines lt rgb "violet" title "{/Symbol x}=0.0015", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_90_XI_0.003.FULL.NUC.csv" using 1:2 with lines lt rgb "violet" title "{/Symbol x}=0.0030", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_90_XI_0.0045.FULL.NUC.csv" using 1:2 with lines lt rgb "violet" title "{/Symbol x}=0.0045", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_90_XI_0.006.FULL.NUC.csv" using 1:2 with lines lt rgb "violet" title "{/Symbol x}=0.0060", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_90_XI_0.0075.FULL.NUC.csv" using 1:2 with lines lt rgb "violet" title "{/Symbol x}=0.0075"


# Settings for Plot 4

set output "../plots/MFT.QCD.B_100.eps"

set key left box linestyle -1

set xrange[0:6000]
set yrange[0:]

set xlabel '{/Symbol r} [MeV fm^{-3}]' font "cmr10,15"
set ylabel 'Pressure [MeV fm^{-3}]' font "cmr10,15"

set title 'MFT QCD, B=100 MeV, {/Symbol r} {/Symbol \264} P'

plot "../workspace/eos.sly4/sly4.dat.NUC.csv" using 1:2 with lines lt rgb "blue" title "Sly4", \
    "../workspace/eos.bps/bps-negele-wiringa.csv" using 1:2 with lines lt rgb "black" title "BPS Negele - Wiringa", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_100_XI_0.0015.FULL.NUC.csv" using 1:2 with lines lt rgb "green" title "{/Symbol x}=0.0015", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_100_XI_0.003.FULL.NUC.csv" using 1:2 with lines lt rgb "green" title "{/Symbol x}=0.0030", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_100_XI_0.0045.FULL.NUC.csv" using 1:2 with lines lt rgb "green" title "{/Symbol x}=0.0045", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_100_XI_0.006.FULL.NUC.csv" using 1:2 with lines lt rgb "green" title "{/Symbol x}=0.0060", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_100_XI_0.0075.FULL.NUC.csv" using 1:2 with lines lt rgb "green" title "{/Symbol x}=0.0075"



# Settings for Plot 5

set output "../plots/MFT.QCD.eps"

set key left box linestyle -1

set xrange[0:6000]
set yrange[0:]

set xlabel '{/Symbol r} [MeV fm^{-3}]' font "cmr10,15"
set ylabel 'Pressure [MeV fm^{-3}]' font "cmr10,15"

set title 'MFT QCD, {/Symbol r} {/Symbol \264} P'

plot "../workspace/eos.sly4/sly4.dat.NUC.csv" using 1:2 with lines lt rgb "blue" title "Sly4", \
    "../workspace/eos.bps/bps-negele-wiringa.csv" using 1:2 with lines lt rgb "black" title "BPS Negele - Wiringa"w, \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_70_XI_0.003.FULL.NUC.csv" using 1:2 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0030", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_70_XI_0.0045.FULL.NUC.csv" using 1:2 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0045", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_70_XI_0.006.FULL.NUC.csv" using 1:2 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0060", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_70_XI_0.0075.FULL.NUC.csv" using 1:2 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_80_XI_0.0015.FULL.NUC.csv" using 1:2 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0015", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_80_XI_0.003.FULL.NUC.csv" using 1:2 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0030", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_80_XI_0.0045.FULL.NUC.csv" using 1:2 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0045", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_80_XI_0.006.FULL.NUC.csv" using 1:2 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0060", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_80_XI_0.0075.FULL.NUC.csv" using 1:2 with lines lt rgb "orange" title "B=80 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_90_XI_0.0015.FULL.NUC.csv" using 1:2 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0015", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_90_XI_0.003.FULL.NUC.csv" using 1:2 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0030", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_90_XI_0.0045.FULL.NUC.csv" using 1:2 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0045", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_90_XI_0.006.FULL.NUC.csv" using 1:2 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0060", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_90_XI_0.0075.FULL.NUC.csv" using 1:2 with lines lt rgb "violet" title "B=90 MeV, {/Symbol x}=0.0075", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_100_XI_0.0015.FULL.NUC.csv" using 1:2 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0015", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_100_XI_0.003.FULL.NUC.csv" using 1:2 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0030", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_100_XI_0.0045.FULL.NUC.csv" using 1:2 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0045", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_100_XI_0.006.FULL.NUC.csv" using 1:2 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0060", \
    "../workspace/eos.mft.qcd.NUC/MFT.QCD.B_100_XI_0.0075.FULL.NUC.csv" using 1:2 with lines lt rgb "green" title "B=100 MeV, {/Symbol x}=0.0075"

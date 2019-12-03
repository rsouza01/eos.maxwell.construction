#!/usr/bin/gnuplot

reset

# Settings for all plots
set datafile separator ","

set encoding iso
set terminal postscript eps enhanced font "cmr10"
set lmargin 10
#set grid

# Settings for Plot 1

set output "../plots/MFT.QCD.mu_P.B_70.eps"

set key left box linestyle -1

set xrange[400:4000]
set yrange[0:]

set xlabel '{/Symbol m} [MeV]' font "cmr10,15"
set ylabel 'Pressure [MeV fm^{-3}]' font "cmr10,15"

set title 'MFT QCD, B=70 MeV, {/Symbol m} {/Symbol \264} P'

plot "../eos.sly4/sly4.dat.NUC.csv" using 4:2 with lines lt rgb "blue" title "Sly4", \
    "../eos.bps/bps-negele-wiringa.csv" using 4:2 with lines lt rgb "black" title "BPS Negele - Wiringa", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_70_XI_0.003.FULL.NUC.csv" using 4:2 with lines lt rgb "red" title "{/Symbol x}=0.0030", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_70_XI_0.0045.FULL.NUC.csv" using 4:2 with lines lt rgb "red" title "{/Symbol x}=0.0045", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_70_XI_0.006.FULL.NUC.csv" using 4:2 with lines lt rgb "red" title "{/Symbol x}=0.0060", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_70_XI_0.0075.FULL.NUC.csv" using 4:2 with lines lt rgb "red" title "{/Symbol x}=0.0075"

# Settings for Plot 2

set output "../plots/MFT.QCD.mu_P.B_80.eps"

set key left box linestyle -1

set xrange[400:4000]
set yrange[0:]

set xlabel '{/Symbol m} [MeV]' font "cmr10,15"
set ylabel 'Pressure [MeV fm^{-3}]' font "cmr10,15"

set title 'MFT QCD, B=80 MeV, {/Symbol m} {/Symbol \264} P'

plot "../eos.sly4/sly4.dat.NUC.csv" using 4:2 with lines lt rgb "blue" title "Sly4", \
    "../eos.bps/bps-negele-wiringa.csv" using 4:2 with lines lt rgb "black" title "BPS Negele - Wiringa", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_80_XI_0.0015.FULL.NUC.csv" using 4:2 with lines lt rgb "#778899" title "{/Symbol x}=0.0015", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_80_XI_0.003.FULL.NUC.csv" using 4:2 with lines lt rgb "#778899" title "{/Symbol x}=0.0030", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_80_XI_0.0045.FULL.NUC.csv" using 4:2 with lines lt rgb "#778899" title "{/Symbol x}=0.0045", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_80_XI_0.006.FULL.NUC.csv" using 4:2 with lines lt rgb "#778899" title "{/Symbol x}=0.0060", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_80_XI_0.0075.FULL.NUC.csv" using 4:2 with lines lt rgb "#778899" title "{/Symbol x}=0.0075"

# Settings for Plot 3

set output "../plots/MFT.QCD.mu_P.B_90.eps"

set key left box linestyle -1

set xrange[400:4000]
set yrange[0:]

set xlabel '{/Symbol m} [MeV]' font "cmr10,15"
set ylabel 'Pressure [MeV fm^{-3}]' font "cmr10,15"

set title 'MFT QCD, B=90 MeV, {/Symbol m} {/Symbol \264} P'

plot "../eos.sly4/sly4.dat.NUC.csv" using 4:2 with lines lt rgb "blue" title "Sly4", \
    "../eos.bps/bps-negele-wiringa.csv" using 4:2 with lines lt rgb "black" title "BPS Negele - Wiringa", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_90_XI_0.0015.FULL.NUC.csv" using 4:2 with lines lt rgb "#7F7F7F" title "{/Symbol x}=0.0015", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_90_XI_0.003.FULL.NUC.csv" using 4:2 with lines lt rgb "#7F7F7F" title "{/Symbol x}=0.0030", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_90_XI_0.0045.FULL.NUC.csv" using 4:2 with lines lt rgb "#7F7F7F" title "{/Symbol x}=0.0045", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_90_XI_0.006.FULL.NUC.csv" using 4:2 with lines lt rgb "#7F7F7F" title "{/Symbol x}=0.0060", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_90_XI_0.0075.FULL.NUC.csv" using 4:2 with lines lt rgb "#7F7F7F" title "{/Symbol x}=0.0075"


# Settings for Plot 4

set output "../plots/MFT.QCD.mu_P.B_100.eps"

set key left box linestyle -1

set xrange[400:4000]
set yrange[0:]

set xlabel '{/Symbol m} [MeV]' font "cmr10,15"
set ylabel 'Pressure [MeV fm^{-3}]' font "cmr10,15"

set title 'MFT QCD, B=100 MeV, {/Symbol m} {/Symbol \264} P'

plot "../eos.sly4/sly4.dat.NUC.csv" using 4:2 with lines lt rgb "blue" title "Sly4", \
    "../eos.bps/bps-negele-wiringa.csv" using 4:2 with lines lt rgb "black" title "BPS Negele - Wiringa", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_100_XI_0.0015.FULL.NUC.csv" using 4:2 with lines lt rgb "black" title "{/Symbol x}=0.0015", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_100_XI_0.003.FULL.NUC.csv" using 4:2 with lines lt rgb "black" title "{/Symbol x}=0.0030", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_100_XI_0.0045.FULL.NUC.csv" using 4:2 with lines lt rgb "black" title "{/Symbol x}=0.0045", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_100_XI_0.006.FULL.NUC.csv" using 4:2 with lines lt rgb "black" title "{/Symbol x}=0.0060", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_100_XI_0.0075.FULL.NUC.csv" using 4:2 with lines lt rgb "black" title "{/Symbol x}=0.0075"



# Settings for Plot 5

set output "../plots/MFT.QCD.mu_P.eps"

set key left box linestyle -1

set xrange[400:4000]
set yrange[0:]

set xlabel '{/Symbol m} [MeV]' font "cmr10,15"
set ylabel 'Pressure [MeV fm^{-3}]' font "cmr10,15"

set title 'MFT QCD, {/Symbol m} {/Symbol \264} P'

set label 1 at   500, 1000 '{/Symbol x}=0.0015' font "cmr10,15"
set label 2 at  1500, 2000 '{/Symbol x}=0.0030' font "cmr10,15"
set label 3 at  2500, 3600 '{/Symbol x}=0.0045' font "cmr10,15"
set label 4 at  3000, 3300 '{/Symbol x}=0.0060' font "cmr10,15"
set label 5 at  3000, 2150 '{/Symbol x}=0.0075' font "cmr10,15"
# set arrow from 3000,2000 to 2950,2150 nohead


plot "../eos.sly4/sly4.dat.NUC.csv" using 4:2 with lines lt rgb "blue" title "Sly4", \
    "../eos.bps/bps-negele-wiringa.csv" using 4:2 with lines lt rgb "green" title "BPS", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_70_XI_0.003.FULL.NUC.csv" using 4:2 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0030", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_70_XI_0.0045.FULL.NUC.csv" using 4:2 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0045", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_70_XI_0.006.FULL.NUC.csv" using 4:2 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0060", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_70_XI_0.0075.FULL.NUC.csv" using 4:2 with lines lt rgb "red" title "B=70 MeV, {/Symbol x}=0.0075", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_80_XI_0.0015.FULL.NUC.csv" using 4:2 with lines lt rgb "#778899" title "B=80 MeV, {/Symbol x}=0.0015", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_80_XI_0.003.FULL.NUC.csv" using 4:2 with lines lt rgb "#778899" title "B=80 MeV, {/Symbol x}=0.0030", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_80_XI_0.0045.FULL.NUC.csv" using 4:2 with lines lt rgb "#778899" title "B=80 MeV, {/Symbol x}=0.0045", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_80_XI_0.006.FULL.NUC.csv" using 4:2 with lines lt rgb "#778899" title "B=80 MeV, {/Symbol x}=0.0060", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_80_XI_0.0075.FULL.NUC.csv" using 4:2 with lines lt rgb "#778899" title "B=80 MeV, {/Symbol x}=0.0075", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_90_XI_0.0015.FULL.NUC.csv" using 4:2 with lines lt rgb "#7F7F7F" title "B=90 MeV, {/Symbol x}=0.0015", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_90_XI_0.003.FULL.NUC.csv" using 4:2 with lines lt rgb "#7F7F7F" title "B=90 MeV, {/Symbol x}=0.0030", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_90_XI_0.0045.FULL.NUC.csv" using 4:2 with lines lt rgb "#7F7F7F" title "B=90 MeV, {/Symbol x}=0.0045", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_90_XI_0.006.FULL.NUC.csv" using 4:2 with lines lt rgb "#7F7F7F" title "B=90 MeV, {/Symbol x}=0.0060", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_90_XI_0.0075.FULL.NUC.csv" using 4:2 with lines lt rgb "#7F7F7F" title "B=90 MeV, {/Symbol x}=0.0075", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_100_XI_0.0015.FULL.NUC.csv" using 4:2 with lines lt rgb "black" title "B=100 MeV, {/Symbol x}=0.0015", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_100_XI_0.003.FULL.NUC.csv" using 4:2 with lines lt rgb "black" title "B=100 MeV, {/Symbol x}=0.0030", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_100_XI_0.0045.FULL.NUC.csv" using 4:2 with lines lt rgb "black" title "B=100 MeV, {/Symbol x}=0.0045", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_100_XI_0.006.FULL.NUC.csv" using 4:2 with lines lt rgb "black" title "B=100 MeV, {/Symbol x}=0.0060", \
    "../eos.mft.qcd.NUC/MFT.QCD.B_100_XI_0.0075.FULL.NUC.csv" using 4:2 with lines lt rgb "black" title "B=100 MeV, {/Symbol x}=0.0075"

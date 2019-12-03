#!/bin/bash

clear

echo "=============================================================================================="
echo "Generating plots..."
echo "=============================================================================================="


echo "Generating all_MFT.QCD.gnuplot..."

gnuplot all_MFT.epsilon_pressure.QCD.gnuplot
gnuplot all_MFT.mu_pressure.QCD.gnuplot
gnuplot qcd_ire.QCD.gnuplot
gnuplot MFT.QCD.Sly4.gnuplot
gnuplot all_MFT_SLY.QCD.gnuplot
echo "=============================================================================================="
echo "Done!"
echo "=============================================================================================="

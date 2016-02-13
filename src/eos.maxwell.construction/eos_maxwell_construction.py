#!/usr/bin/python

# eos.maxwell.construction - EoS merger based on the Maxwell Construction
# Copyright (C) 2015 Rodrigo Souza <rsouza01@gmail.com>

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
# 02110-1301, USA.


import sys
import config
import eos
import os
import warnings
import string
import matplotlib.pyplot as plt
import numpy as np

from scipy.optimize import fsolve


def find_intersection(pressure_hadrons, pressure_quarks, mu_0):
    """
    Finds the point where the two functions intersect.
    Arguments:
        pressure_hadrons(function) -- pressure from mu, hadrons
        pressure_quarks(function) -- pressure from mu, quarks
        mu_0(float) -- initial guess

    """

    # # HADRONS
    # # 3181.0392079975 -> 2600.8357501993
    # chem_pot = 3181.0392079975
    # pressure_real = 2600.8357501993
    # pressure = fHadrons(chem_pot)
    # print("###########    hadron_eos({}) = {}, interp = {}".format(chem_pot, pressure_real, pressure))
    #
    # # QCD
    # # 6911.94413912 -> 13932.80346
    # chem_pot = 6911.94413912
    # pressure_real = 13932.80346
    # pressure = fQuarks(chem_pot)
    # print("###########    quark_eos({}) = {}, interp = {}".format(chem_pot, pressure_real, pressure))

    # chem_pot = mu_0
    # print("# hadron_eos({}) = {}".format(chem_pot, pressure_hadrons(chem_pot)))
    # print("# quark_eos({}) = {}".format(chem_pot, pressure_quarks(chem_pot)))
    # mu_0 = 2700

    return fsolve(lambda mu: pressure_quarks(mu) - pressure_hadrons(mu), mu_0)


def find_range_intersection(range_hadrons, range_quarks):
    inf_limit = max(range_hadrons.inf_limit, range_quarks.inf_limit)
    sup_limit = min(range_hadrons.sup_limit, range_quarks.sup_limit)

    return eos.EoSRange(inf_limit, sup_limit)


def main(argv):

    conf = config.get_cl_parameters(argv)

    conf = config.get_parameters_from_conf(conf)

    print("#" * 80)
    print("# config_name = {}".format(conf.config_file))
    print("# mu_0 = {}".format(conf.mu_0))
    print("# quarks_eos_file_name = {}".format(conf.quarks_eos_file_name))
    print("# hadrons_eos_file_name = {}".format(conf.hadrons_eos_file_name))

    hadron_eos = eos.EoS(conf.hadrons_eos_file_name, False)
    quark_eos = eos.EoS(conf.quarks_eos_file_name, False)

    range_intersection = find_range_intersection(
        hadron_eos.pressure_from_chem_potential().get_range(),
        quark_eos.pressure_from_chem_potential().get_range())

    print("#")
    print("# Range Quarks - P(mu) = {}".format(quark_eos.pressure_from_chem_potential().get_range()))
    print("# Range Hadrons - P(mu)  = {}".format(hadron_eos.pressure_from_chem_potential().get_range()))
    print("#")

    print("# Range = {}".format(range_intersection))

    # warnings.simplefilter("ignore")

    # TESTE
    #
    # HADRONS
    # 3181.0392079975 -> 2600.8357501993
    # chem_pot = 3181.0392079975
    # pressure = hadron_eos.pressure_from_chem_potential().get_function()(chem_pot)
    # print("###########    hadron_eos({}) = {}".format(chem_pot, pressure))

    # QCD
    # 6911.94413912 -> 13932.80346
    # chem_pot = 6911.94413912
    # chem_pot = 6911.94413912
    # pressure = quark_eos.pressure_from_chem_potential().get_function()(chem_pot)
    # print("###########    quark_eos({}) = {}".format(chem_pot, pressure))

    try:
        mu_border = find_intersection(hadron_eos.pressure_from_chem_potential().get_function(),
                                      quark_eos.pressure_from_chem_potential().get_function(),
                                      conf.mu_0)
    except ValueError:
        print("# Try another initial guess for the chemical potential.")
        print("#" * 80)
        sys.exit(-1)

    pressure_transition_hadron = hadron_eos.pressure_from_chem_potential().get_function()(mu_border)
    pressure_transition_quark = quark_eos.pressure_from_chem_potential().get_function()(mu_border)

    print("#")
    print("# Transition pressure (hadrons) = {}".format(pressure_transition_hadron))
    print("# Transition pressure (quarks) = {}".format(pressure_transition_quark))
    print("#")
    print("#" * 80)

    print("# energy density [MeV fm-3], pressure [MeV fm-3], chem_potential [fm-3]")

    chem_potential_bin = np.linspace(range_intersection.sup_limit-1,
                                     range_intersection.inf_limit+1,
                                     conf.bin_size)

    eos_phase = None

    for chem_potential in chem_potential_bin:

        if chem_potential < mu_border:

            if eos_phase is None or eos_phase == eos.EosPhase.quark:
                print("#" + 78*"H")
                print("#" + " BEGINNING OF HADRON PHASE")
                print("#" + 78*"H")
                eos_phase = eos.EosPhase.hadron

            eos_function = hadron_eos.pressure_from_chem_potential().get_function()
            pressure = eos_function(chem_potential)

            energy = hadron_eos.energy_from_pressure(pressure)
            # rho = energy / 2.998e10 ** 2.

        else:
            if eos_phase is None or eos_phase == eos.EosPhase.hadron:
                print("#" + 78*"Q")
                print("#" + " BEGINNING OF QUARK PHASE")
                print("#" + 78*"Q")
                eos_phase = eos.EosPhase.quark

            eos_function = quark_eos.pressure_from_chem_potential().get_function()
            pressure = eos_function(chem_potential)
            energy = quark_eos.energy_from_pressure(pressure)
            # rho = energy / 2.998e10 ** 2.



        # print("(mu, epsilon, P) = ({}, {}, {})".format(chem_potential, energy, pressure))
        # CGS
        # print("{}, {}, {}".format(rho, pressure, chem_potential))
        # NUC
        print("{}, {}, {}".format(energy, pressure, chem_potential))


if __name__ == "__main__":
    main(sys.argv[1:])

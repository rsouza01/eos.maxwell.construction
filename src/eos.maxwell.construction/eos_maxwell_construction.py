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
import numpy as np
from scipy.optimize import fsolve


def find_intersection(fun1, fun2, x0):
    return fsolve(lambda x: fun1(x) - fun2(x), x0)


def find_range_intersection(range_hadrons, range_quarks):
    inf_limit = max(range_hadrons.inf_limit, range_quarks.inf_limit)
    sup_limit = min(range_hadrons.sup_limit, range_quarks.sup_limit)

    return eos.EoSRange(inf_limit, sup_limit)


def main(argv):
    # os.system('cls' if os.name == 'nt' else 'clear')

    config_name = config.get_cl_parameters(argv)

    conf = config.get_parameters_from_conf(config_name)

    print("#"*80)
    print("# config_name = {}".format(config_name))
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

    mu_border = find_intersection(hadron_eos.pressure_from_chem_potential().get_function(),
                                  quark_eos.pressure_from_chem_potential().get_function(),
                                  range_intersection.inf_limit)

    chem_potential_bin = np.linspace(range_intersection.sup_limit,
                                     range_intersection.inf_limit,
                                     conf.bin_size)

    pressure_transition_hadron = hadron_eos.pressure_from_chem_potential().get_function()(mu_border)
    pressure_transition_quark = quark_eos.pressure_from_chem_potential().get_function()(mu_border)

    print("#")
    print("# Transition pressure (hadrons) = {}".format(pressure_transition_hadron))
    print("# Transition pressure (quarks) = {}".format(pressure_transition_quark))
    print("#")
    print("#"*80)

    print("# rho, pressure, chem_potential")

    for chem_potential in chem_potential_bin:

        if chem_potential < mu_border:
            eos_function = hadron_eos.pressure_from_chem_potential().get_function()
            pressure = eos_function(chem_potential)
            energy = hadron_eos.energy_from_pressure(pressure)
            rho = energy / 2.998e10**2.

        else:
            eos_function = quark_eos.pressure_from_chem_potential().get_function()
            pressure = eos_function(chem_potential)
            energy = quark_eos.energy_from_pressure(pressure)
            rho = energy / 2.998e10**2.


        # print("(mu, epsilon, P) = ({}, {}, {})".format(chem_potential, energy, pressure))
        print("{}, {}, {}".format(rho, pressure, chem_potential))


if __name__ == "__main__":
    main(sys.argv[1:])

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


def main(argv):

    config_name = config.get_cl_parameters(argv)

    conf = config.get_parameters_from_conf(config_name)

    print("config_name = {}".format(config_name))
    print("hadrons_eos_file_name = {}".format(conf.hadrons_eos_file_name))
    print("quarks_eos_file_name = {}".format(conf.quarks_eos_file_name))

    hadron_eos = eos.EoS(conf.hadrons_eos_file_name, False)
    quark_eos = eos.EoS(conf.quarks_eos_file_name, False)

    # quark_eos.pretty_print()
    # hadron_eos.pretty_print()

    # print("hadron_eos.pressure_from_energy(1.589312795304E36) = {}".format(hadron_eos.pressure_from_energy(1.589312795304E+036)))
    # print("hadron_eos.pressure_from_energy(5.9518562eE36) = {}".format(hadron_eos.pressure_from_energy(5.9518562e36)))

if __name__ == "__main__":
    main(sys.argv[1:])

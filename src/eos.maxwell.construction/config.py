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
import getopt
import ConfigParser as cp
from collections import namedtuple


class ConfigParameters(namedtuple('ConfigParameters',
                                  'hadrons_eos_file_name quarks_eos_file_name')):
    """
    Named tuple that represents the parameters in the file tov_solver.conf
    """
    pass


def usage():
    print(
        "Usage: \n" +
        "    eos_maxwell_construction.py <--config=config_file_name> \n")


def config_section_map(config, section):
    dict1 = {}
    options = config.options(section)

    for option in options:
        try:
            dict1[option] = config.get(section, option)
        except:
            print("exception on %s!" % option)
            dict1[option] = None

    return dict1


def get_cl_parameters(argv):
    """
    Extracts the command line parameters.
    :param argv:
    :return:
    """
    config_file = "properties.conf"

    try:
        opts, args = getopt.getopt(argv, "hc:", ["help", "config="])
    except getopt.GetoptError as err:
        print(err)
        usage()
        sys.exit(2)

    for opt, arg in opts:

        if opt in ("-c", "--config"):
            config_file = arg

        elif opt == '-h':
            usage()
            exit(0)
        else:
            assert False, "Unhandled exception."

    return config_file


def get_parameters_from_conf(config_name):

    config = cp.ConfigParser()
    config.read(config_name)

    # EOS Parameters
    hadrons_eos_file_name = config_section_map(config, "EOS_Hadrons")["eos_file_name"]
    quarks_eos_file_name = config_section_map(config, "EOS_Quarks")["eos_file_name"]

    config = ConfigParameters(hadrons_eos_file_name, quarks_eos_file_name)

    return config

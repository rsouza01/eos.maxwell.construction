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


import csv
import numpy

from collections import namedtuple
from scipy import interpolate
import cgs_constants as const


import matplotlib.pyplot as plt


MASS_DENSITY_INDEX = 0
PRESSURE_INDEX = 1
BARYONIC_NUMBER_INDEX = 2
ENERGY_DENSITY_INDEX = 3
CHEM_POTENTIAL_INDEX = 4


class EoSValue(namedtuple('EoSValue', 'mass_density pressure baryonic_number energy chemical_potential')):
    """
    Named tuple that represents an EoS value
    """
    pass

class EoS:

    def __init__(self, filename, verbose=False):

        self.inferior_range = 0.
        self.superior_range = 0.

        self.__filename = filename

        loader = EoSLoader(self.__filename)

        self.__eos = loader.loadEoSFile()

        interp = EoSInterpolation(loader.getEoSList())

        self.__energy_from_pressure_function = \
            interp.interpolate_spline_energy_from_pressure(plotFit=verbose)

        # TODO: There's something wrong here, it returns a function array instead of a function.
        self.__pressure_from_energy_function = \
            interp.interpolate_spline_pressure_from_energy(plotFit=verbose)

        self.__pressure_from_chem_potential_function = \
            interp.interpolate_spline_pressure_from_chem_potential(plotFit=verbose)

    def energy_from_pressure(self, pressure):

        # print("energy_from_pressure(%f)" % (pressure))

        return self.__energy_from_pressure_function(pressure)

    def pressure_from_energy(self, energy):

        # print("pressure_from_energy(%f)" % (energy))

        return self.__pressure_from_energy_function(energy)

    def pressure_from_chem_potential(self, chem_potential):

        print("pressure_from_chem_potential(%f)" % (chem_potential))

        return self.__pressure_from_chem_potential_function(chem_potential)

    def pretty_print(self):

        for element in self.__eos:

            print("{}".format(element))


class EoSLoader:
    """ EoS Loader. """

    __eosList = []

    def __init__(self, filename):

        self.__filename = filename

        # print("self.__central_energy_density = {}".format(self.__central_energy_density))

    def getEoSList(self):
        return self.__eosList

    def loadEoSFile(self):

        with open(self.__filename, 'r') as f:
            reader = csv.reader(f)
            for row in reader:
                if not row[0].startswith('#'):

                    mass_density = float(row[MASS_DENSITY_INDEX])
                    energy = float(row[MASS_DENSITY_INDEX])*const.LIGHT_SPEED**2.
                    pressure = float(row[PRESSURE_INDEX])
                    baryonic_number = float(row[BARYONIC_NUMBER_INDEX])
                    chemical_potential = (energy + pressure)/baryonic_number

                    eos_value = EoSValue(
                        mass_density=mass_density,
                        energy=energy,
                        pressure=pressure,
                        baryonic_number=baryonic_number,
                        chemical_potential=chemical_potential)

                    self.__eosList.append(eos_value)

        # print(self.__eosList)

        # firstColumn = [row[0] for row in self.__eosList]

        # print(firstColumn)

        return self.__eosList


class EoSInterpolationFunction:

    __INDEX_X = 0
    __INDEX_Y = 1

    def __init__(self, xy_values, x_name, y_name):

        self.__xy_values = xy_values

        # Checking ranges.
        self.__inferior_range = self.__xy_values[0][self.__INDEX_X]
        self.__superior_range = self.__xy_values[len(self.__xy_values)-1][self.__INDEX_X]

        print("self.__inferior_range = {}".format(self.__inferior_range))
        print("self.__superior_range = {}".format(self.__superior_range))

        # Must sort the list in order to the interpolation routines work.
        if self.__inferior_range > self.__superior_range:

            self.__xy_values.sort()

            self.__inferior_range = self.__xy_values[0][self.__INDEX_X]
            self.__superior_range = self.__xy_values[len(self.__xy_values)-1][self.__INDEX_X]

        self.__function = interpolate.interp1d(
            zip(*self.__xy_values)[self.__INDEX_X],
            zip(*self.__xy_values)[self.__INDEX_Y])

        # 4.1796461e+35, 1.10198e+35
        # print("###########f(4.1796461e+35) = {}".format(self.__function(4.1796461e+35)))

        plt.figure()
        plt.plot(zip(*self.__xy_values)[self.__INDEX_X],
                 self.__function(zip(*self.__xy_values)[self.__INDEX_X]), 'x',
                 zip(*self.__xy_values)[self.__INDEX_X], zip(*self.__xy_values)[self.__INDEX_Y])
        plt.legend(['True', 'Cubic Spline'])
        plt.ylabel("Energy")
        plt.xlabel("Pressure")
        plt.title("\epsilon(P)")
        plt.show()


class EoSInterpolation:
    """ EoS Interpolation. """

    def __init__(self, eosList):

        self.__eosList = eosList

        self.__energyValues = numpy.asarray(
            [row.energy for row in self.__eosList],  dtype=numpy.float32)

        self.__pressureValues = numpy.asarray(
            [row.pressure for row in self.__eosList],  dtype=numpy.float32)

        self.__baryonicNumberValues = numpy.asarray(
            [row.baryonic_number for row in self.__eosList],  dtype=numpy.float32)

        self.__chemPotentialValues = numpy.asarray(
            [row.chemical_potential for row in self.__eosList],  dtype=numpy.float32)

    def interpolate_spline_energy_from_pressure(self, plotFit=False):

        fc = interpolate.interp1d(self.__pressureValues[::-1], self.__energyValues[::-1])

        if plotFit:
            plt.figure()
            plt.plot(self.__pressureValues,
                     fc(self.__pressureValues), 'x',
                     self.__pressureValues, self.__energyValues)
            plt.legend(['True', 'Cubic Spline'])
            plt.ylabel("Energy")
            plt.xlabel("Pressure")
            plt.title("\epsilon(P)")
            plt.show()
            plt.gcf().clear()

        return fc

    def interpolate_spline_pressure_from_chem_potential(self, plotFit=False):

        function = EoSInterpolationFunction(
            zip(self.__chemPotentialValues[::-1],
                self.__pressureValues[::-1]), "mu", "P")



        fc = interpolate.interp1d(self.__chemPotentialValues[::-1], self.__pressureValues[::-1])

        return fc

    def interpolate_spline_pressure_from_energy(self, plotFit=False):

        fc = interpolate.interp1d(self.__energyValues[::-1], self.__pressureValues[::-1])

        if plotFit:
            plt.figure()
            plt.plot(self.__energyValues,
                     fc(self.__energyValues), 'o',
                     self.__energyValues, self.__pressureValues)
            plt.legend(['True', 'Cubic Spline'])
            plt.xlabel("Energy")
            plt.ylabel("Pressure")
            plt.title("P(e)")
            plt.show()
            plt.gcf().clear()

        return fc

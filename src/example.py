'''
 Copyright (C) 2022  Your FullName

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; version 3.

 calculator is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
'''
from math import *

def calcbutton(text):
    return text

def delete(text):
    remaining_string = text[:-1]
    return remaining_string

def percent(text):
    return float(text)*0.01

def NumRoot(text):
    return sqrt(float(text))


def calculate(expression):
    print(expression)
    try:
        return (True, eval(expression, globals()))
    except:
        return (False, expression)

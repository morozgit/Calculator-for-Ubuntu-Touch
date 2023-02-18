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
import logging


def calcbutton(text):
    num = float(text)
    return num

def delete(text):
    remaining_string = text[:-1]
    return remaining_string

def factorial(text):
    factorial = 1
    for i in range(2,int(text)+1):
        factorial = factorial * i
    return factorial

def NumRoot(text):
    res = sqrt(float(text))
    #logging.debug(text)
    return float('{:.10f}'.format(res))

def Sing(text):
    sing = text
    return(sing)

def PlusMinus(text):
    num = float(text)
    return num * (- 1)

def Power(text):
    num = float(text)
    return num


def calculate(text):
    print(text)
    code = compile(text, "<string>", "eval")
    res = eval(code)
    return float('{:.4f}'.format(res))
#    try:
#        res  = (True, eval(code))
#        return float('{:.4f}'.format(res[1]))
#    except:
#        return "error"

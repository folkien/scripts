#!/usr/bin/python
#
import sys, argparse, os

match = sys.argv[1]
tekst = sys.stdin.read() #Czytamy wszystko z bufora
# Dopoki nie trafimy na match 1 lub koniec tekstu
pos_start = tekst.find(match)
print tekst[pos_start:]


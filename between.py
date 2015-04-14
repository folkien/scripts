#!/usr/bin/python
#

import sys, argparse, os

match_start = sys.argv[1]
match_stop   = sys.argv[2]

tekst = sys.stdin.read() #Czytamy wszystko z bufora

# Dopoki nie trafimy na match 1 lub koniec tekstu
pos_start = tekst.find(match_start)
pos_stop =  tekst.find(match_stop, pos_start)

if (pos_start > 0) :
    print tekst[pos_start:pos_stop]


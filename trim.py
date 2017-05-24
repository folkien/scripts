#!/usr/bin/python
#
import sys

tekst = sys.stdin.read() #Czytamy wszystko z bufora
#tekst = tekst.strip() # remove spaces from start and end of string
tekst = '\n'.join( [' '.join(s.split()) for s in tekst.splitlines()])
#tekst = ' '.join(tekst.split(" ")) # remove internal whitespaces
tekst += "\n"
sys.stdout.write(tekst)


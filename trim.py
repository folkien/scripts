#!/usr/bin/python
#
import sys

tekst = sys.stdin.read() #Czytamy wszystko z bufora
#tekst = tekst.strip() # remove spaces from start and end of string
tekst = ' '.join(tekst.split()) # remove internal whitespaces
sys.stdout.write(tekst)


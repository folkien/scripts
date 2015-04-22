#!/usr/bin/python
#
import sys, argparse, os


tekst = sys.stdin.read() #Czytamy wszystko z bufora
tekst = tekst.strip()
sys.stdout.write(tekst)


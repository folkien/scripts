#!/usr/bin/python3
import pickle
import sys
import matplotlib.pyplot as plt

ax = pickle.load(open(sys.argv[1], "rb"))
plt.show()

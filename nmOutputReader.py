import csv

sums = {}
sums['T'] = 0
sums['B'] = 0
sums['R'] = 0
sums['D'] = 0
sums['W'] = 0

with open('data.csv', 'rb') as csvfile:
     spamreader = csv.reader(csvfile, delimiter=' ', quotechar='|')
     for row in spamreader:
         sums[row[2].upper()] += int(row[1])

print "#Flash"
print "Text : ",  sums['T']
print "Data : ",  sums['D']
print "-------------------------"
print "Total : ",  (sums['D']+sums['T'])

print "\n#RAM:"
print "ReadOnly : ",  sums['R']
print "BSS : ",  sums['B']
print "Weak : ",  sums['W']
print "-------------------------"
print "Total : ",  (sums['R']+sums['B']+sums['W'])


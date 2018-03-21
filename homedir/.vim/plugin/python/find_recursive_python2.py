import sys
from myprograms import finder_python2

haysack = sys.argv[1]
needle  = sys.argv[2]

hits = finder_python2.findRecursive(haysack, needle)

for lines in hits:
    for found in lines:
        print("{}({}): {}".format(found[2], found[0], found[1]))


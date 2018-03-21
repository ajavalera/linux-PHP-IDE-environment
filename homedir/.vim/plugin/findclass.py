import vim 
import sys

sys.path.append("/home/vagrant/.vim/plugin/python")

from myprograms import finder

def printOutputList(mylist):
    for myline in mylist:
        print(myline)

def getSearchHits():
    needle  = vim.eval('expand("<cword>")')
    haysack = vim.eval('expand("%:p:h")')

    return finder.findRecursive(haysack, needle)


def findInPath():
    hits = getSearchHits()

    output = []
    for filehits in hits:
        for lines in filehits:
            output.append("{}({}):{}".format(lines[2], lines[0], lines[1]))
    
    printOutputList(output)

def openFoundInPath():
    hits = getSearchHits()

    output = []
    for filehits in hits:
        for line in filehits:
            if not line[2] in output:
                output.append(line[2])
                
    printOutputList(output)

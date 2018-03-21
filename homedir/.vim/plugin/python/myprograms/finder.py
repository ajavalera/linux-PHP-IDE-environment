import re
import glob

"""
Finds a needle string inside a haysack file located at file_path.

file_path  string  The full path of the file to search in.
needle     string  The string to look for.

NOTES: Recursions needs for functions to be called in Python3.
"""
def findlines(file_path, needle):
    count           = 0
    hits            = []

    for line in open(file_path, 'r'):
        count += 1

        if re.search(needle, line):
            hits.append([count, line, file_path])

    return hits

def findRecursive(start_path, needle):
    searchpath  = "{}/**/*.php".format(start_path)
    path_list   = glob.iglob(searchpath, recursive=True)
    hits_in_file = []

    for file_found in path_list:
        hit = findlines(file_found, needle)
        if hit :
            hits_in_file.append(hit)

    return hits_in_file

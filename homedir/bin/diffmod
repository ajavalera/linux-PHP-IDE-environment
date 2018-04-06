#!/bin/bash

# Creates a temporal file with the original content of a modified file, and them compares them
# to find the differences in the changes.
#

set -eu

file=$1

git stash
cat $file > $file.old
git stash apply
vimdiff $file $file.old

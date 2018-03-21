#!/bin/bash
set -eu

if [ -z ${1+x} ] || [ -z ${2+x} ]; then
    echo "Find which lines containing a 'needle' inside a 'haysack' have more than the alloted number or characters."
    echo ""
    echo "    search_long_lines needle haysack [alloted characters(int)]"
    echo""
    echo "First two parameters are mandatory. If the third parameter is not set, alloted chars are 121."
    exit
fi

maxChars=300
needle=$1
haysack=$2

if [ -z ${3+x} ]; then
    minChars=122
else
    minChars=$(($3+1))
fi

grep -Hnx '.\{'$minChars','$maxChars'\}' $(grep -rl $needle $haysack) | grep --color $needle

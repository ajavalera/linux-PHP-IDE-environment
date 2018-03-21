#!/bin/bash

#Finds and replaces class names and class file names.

# $1 First Argument: Needle.
# $2 Second Argument: Replacement
# $3 Third Argument: Haysack (directory where the needle resides).

find $3 -type f -exec sed -i "s#$1#$2#g" {} +
mv $3/$1.php $3/$2.php


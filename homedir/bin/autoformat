#!/bin/bash
set -eu

find $1 -type f -name "*.php" -exec sed -i 's/ if(/ if (/g' {} +
find $1 -type f -name "*.php" -exec sed -i 's/ foreach(/ foreach (/g' {} +
find $1 -type f -name "*.php" -exec sed -i 's/ for(/ for (/g' {} +
find $1 -type f -name "*.php" -exec sed -i 's/){/) {/g' {} +
find $1 -type f -name '*.php' -exec sed -i 's/ )/)/g' {} +
find $1 -type f -name "*.php" -exec sed -i 's/( /(/g' {} +
find $1 -type f -name "*.php" -exec sed -i 's/       )/        )/g' {} +
find $1 -type f -name "*.php" -exec sed -i 's/ var / public /g' {} +
find $1 -type f -name "*.php" -exec sed -i 's/=  /= /g' {} +
find $1 -type f -name "*.php" -exec sed -i 's/=   /= /g' {} +
find $1 -type f -name "*.php" -exec sed -i 's/=    /= /g' {} +

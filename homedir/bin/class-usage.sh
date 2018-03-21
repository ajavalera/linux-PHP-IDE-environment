#!/bin/bash

grep --color=always -rin -- "^.*new $1.*" $2 
echo "------------------------"
grep --color=always -rin -- "^./$1.*" $2

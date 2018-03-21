#!/bin/bash 

tar -cf - $1 | gzip -9 > $1.tar.gz
echo "Tar done..."


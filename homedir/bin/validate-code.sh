#!/bin/bash

echo "start------"
phpcs --standard=PSR2 $1 --ignore=vendor,coverage
echo "-----------"
phpmd $1 text ./phpmd.xml.dist --exclude vendor,coverage
echo "------- done"

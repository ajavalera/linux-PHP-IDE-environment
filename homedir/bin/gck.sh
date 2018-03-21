#!/bin/bash

clear && \
git checkout $1 $2 && \
git branch && \
echo "-----------" && \
git status -s


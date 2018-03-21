#!/bin/bash

clear && \
git reset HEAD $1 && \
git branch && \
echo "------------" && \
git status -s


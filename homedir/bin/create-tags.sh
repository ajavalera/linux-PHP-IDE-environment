#!/bin/bash

echo "Creating tags for $1 $2 $3 ..."

ctags-exuberant -R -f tags $1 $2 $3 --exclude=tags

echo "tags file created, you can load it into VIM now."


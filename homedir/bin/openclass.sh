#!/bin/bash
set -eu

vim $(find-class.sh $1 $2)


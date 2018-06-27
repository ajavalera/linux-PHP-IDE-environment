#!/bin/bash
set -eu

#!/bin/bash

if [ -z ${1+x} ]; then 
    echo "Use option -h for usage help."
    exit
fi

path="${PWD}"

if [ ! -z "${2+x}" ]; then
    path="$2"
fi

for opt in "$@"; do
    case $opt in
        "-o" | "--open" )
            if [ -z ${2+x} ]; then
                echo "Wrong parameter count: Use option -h for usage help."
                exit
            fi


            vim $(find $path -iname "*$1*");
            exit
            ;;
        "-h" | "--help" )
            echo ""
            echo "Find a named file (soft search)"
            echo ""
            echo "   findfile <filename> [--option]"
            echo ""
            echo "Options:"
            echo "  -h"
            echo "    --help Print this help message"
            echo "  -o"
            echo "   --open  Open found files in vim"
            exit;
            ;;
    esac
done

find $path -iname "*$1*"


#!/bin/bash

if [ -z ${1+x} ]; then 
    echo "Use option -h for usage help."
    exit
fi

for opt in "$@"; do
    case $opt in
        "-o" | "--open" )
            if [ -z ${3+x} ]; then
                echo "Wrong parameter count: Use option -h for usage help."
                exit
            fi

            vim $(grep -Erol --exclude-dir=.git --exclude-dir=var  --exclude=tags -- "^(class|abstract class|interface) $1.*$" $2)
            exit
            ;;
        "-r" | "--raw" )
            if [ -z ${3+x} ]; then
                echo "Wrong parameter count: Use option -h for usage help."
                exit
            fi

            grep -Erol --exclude-dir=.git --exclude-dir=var  --exclude=tags -- "^(class|abstract class|interface) $1.*$" $2
            exit
            ;;
        "-h" | "--help" )
            echo ""
            echo "Find class|abtract class|interface files."
            echo ""
            echo "   findclass needle haysack [option]"
            echo ""
            echo "Options:"
            echo "  -h"
            echo "    --help Print this help message"
            echo "  -o"
            echo "   --open  Open found classes in vim"
            echo "  -r"
            echo "  --raw Print output without styling or clasification"
            exit;
            ;;
    esac
done

if [ -z ${2+x} ]; then 
    echo "Use option -h for usage help."
    exit
fi

echo "Class files:"
grep -Erol --exclude-dir=.git --exclude=tags --exclude-dir=var --color=auto -- "^class $1.*$" $2 
echo ""
echo "Abstract classes and Interfaces:"
grep -Erol --exclude-dir=.git --exclude=tags --exclude-dir=var --color=auto -- "^abstract class $1.*$" $2 
grep -Erol --exclude-dir=.git --exclude=tags --exclude-dir=var --color=auto -- "^interface $1.*$" $2 

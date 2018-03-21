#!/bin/bash
set -eu

if [ -z ${1+x} ] ; then
    echo "Use option -h for help."
    exit;
fi

for opt in "$@"; do
    case $opt in
        "-s" | "--short" )
            if [ -z ${3+x} ]; then
                echo "Wrong argument count: use option -h for help."
                exit
            fi

            grep -rnl --exclude=tags --exclude-dir=.git --exclude-dir=var --color=auto  -- "$1" $2
            exit
            ;;

        "-o" | "--open" )
            if [ -z ${3+x} ]; then
                echo "Wrong argument count: use option -h for help."
                exit
            fi

            vim -c "/$1" $(grep -rnl --exclude=tags --exclude-dir=.git --exclude-dir=var -- "$1" $2)
            exit
            ;;
        "-h" | "--help" )
            echo ""
            echo "Find a word inside files recursibly - This is to find usages of class names or variables"
            echo ""
            echo "   findusage needle haysack [option]"
            echo ""
            echo "  Options:"
            echo "  -h:" 
            echo "  --help: Displays this help message"
            echo "  -s"
            echo "  --short: Returns only the file path with out the line numbers or line found"
            echo "  -o:"
            echo "  --open: Opens the files where the needle was found in VIM to edit"
            exit
            ;;
    esac
done

if [ -z ${2+x} ] ; then
    echo "Use option -h for help."
    exit;
fi

grep -rn --exclude=tags --exclude-dir=.git --exclude-dir=var --color=auto  -- "$1" $2
exit

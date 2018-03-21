#!/bin/bash

logfile=~/tmp/logs/docker
working_dir=$(pwd)

if [ ! -d "$logfile" ]; then
    echo "Creating the tmp dir $logfile"
    mkdir -p $logfile
fi

clear
echo "Executing docker-compose in: $working_dir"
echo "Log file will be: $logfile/build.log"

docker-compose up -d $1 $2 | tee "$logfile/build.log"

echo "Docker-compose done"


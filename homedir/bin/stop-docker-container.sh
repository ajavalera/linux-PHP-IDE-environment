#!/bin/bash

docker stop $(docker ps -qa)

echo "Containers stoped..."

docker rm -f $(docker ps -qa)

echo "Containers deleted"

docker ps -a


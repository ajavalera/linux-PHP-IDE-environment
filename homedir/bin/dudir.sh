#!/bin/bash

content=$(du -sh $1)
echo "File size: $content"


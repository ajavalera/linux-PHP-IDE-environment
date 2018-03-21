#!/bin/bash
set -eu

echo "Starting PHP Lint in all PHP files inside $1"
find $1 -type f -name '*.php' -exec php -l {} \; | (! grep -v "No syntax errors detected" )


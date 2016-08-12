#!/bin/bash

# Need to check that the script was passed a variable (filename)
if [ $# -lt 2 ]; then
    echo "You must provide one search term and at least one filename. For example:"
    echo "$0 error test.log"
    echo "$0 'error phrase' test.log"
    echo
    exit 1
fi

searchTerm=$1
shift

for file in "$@";do
    printf "\x1f\x8b\x08\x00\x00\x00\x00\x00" |cat - $file |gzip -dc 2>/dev/null |grep "$searchTerm" -
done

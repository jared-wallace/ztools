#!/bin/bash

# Need to check that the script was passed a variable (filename)
if [ $# -lt 1 ]; then
    echo "You must provide a filename. For example:"
    echo "$0 test.log"
    echo
    exit 1
fi

printf "\x1f\x8b\x08\x00\x00\x00\x00\x00" |cat - $1 |gzip -dc 2>/dev/null |vim -

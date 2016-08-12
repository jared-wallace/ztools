#!/bin/bash

# Need to check that the script was passed a variable (filename)
if [ $# -lt 1 ]; then
    echo "You must provide at least one filename. For example:"
    echo "$0 test.log"
    echo
    exit 1
fi

for file in "$@";do
    printf "\x1f\x8b\x08\x00\x00\x00\x00\x00" |cat - $file |gzip -dc > $file.unzipped 2>/dev/null
done

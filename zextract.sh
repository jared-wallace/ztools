#!/bin/bash

#################################################################################
# Copyright (c) October 5, 2016 Jared Wallace.
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v10.html
#
# Contributors:
#    Jared Wallace- initial implementation and/or initial documentation
#################################################################################

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

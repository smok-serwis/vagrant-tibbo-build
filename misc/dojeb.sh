#!/bin/bash

if [ -z $1 ]; then
    echo "Argument required - user to install for"
    exit 1
fi

bash install.sh
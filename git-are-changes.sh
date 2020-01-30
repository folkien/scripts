#!/bin/bash

# Check if local changes occured and have t ostage
git status | grep "Changes not staged" > /dev/null
if [ $? -eq 0 ]; then
    echo 1
    exit 1
fi
echo 0
exit 0

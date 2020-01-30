#!/bin/bash

# Check status - if git repository
git status &> /dev/null

# This is not git repository
[ $? -ne 0 ] && echo "0" && exit 0

# This is git repository
echo 1 && exit 1

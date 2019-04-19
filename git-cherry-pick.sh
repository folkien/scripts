#!/bin/bash
# Git edycja N commitow na dotyłu gdzie N to pierwszy argument.
source /etc/messages.sh

# Assert - changes stash
git status | grep "Changes not staged" > /dev/null
if [ $? -eq 0 ]; then
    echo "Changes not staged!"
    exit 1
fi

# Assert - changes stash
if [ $# -lt 2 ]; then
    echo "Too few arguments!"
    exit 2
fi

commit=$1
branchTo=$2
branchFrom=$(git symbolic-ref -q HEAD)
branchFrom=${branchFrom##refs/heads/}
branchFrom=${branchFrom:-HEAD}

# Checkout
git checkout ${branchTo}
if [ $? -ne 0 ]; then
    echo "Checkout error!"
    exit 3
fi

# Cherry-pick
git cherry-pick ${commit}
if [ $? -eq 0 ]; then
    # Checkout back
    git checkout ${branchFrom}
    if [ $? -ne 0 ]; then
        echo "Checkout error!"
        exit 3
    fi
fi


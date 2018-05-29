#!/bin/bash
# Git edycja N commitow na dotyłu gdzie N to pierwszy argument.
NumberOfCommits=$1

git stash
git rebase -i HEAD~${NumberOfCommits}
if [ $? -eq 0 ]; then
    git stash apply
fi

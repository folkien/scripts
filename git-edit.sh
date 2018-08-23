#!/bin/bash
# Git edycja N commitow na dotyłu gdzie N to pierwszy argument.
NumberOfCommits=$1
localChanges=0

git status | grep "Changes not staged" > /dev/null
if [ $? -eq 0 ]; then
    localChanges=1
    git stash
fi

re='^[0-9]+$'
if [[ $NumberOfCommitsr =~ $re ]] ; then
    git rebase -i HEAD~${NumberOfCommits}
else
    git rebase -i ${NumberOfCommits}
fi

if [ $? -eq 0 ]; then
    if [ $localChanges -eq 1 ]; then
        git stash apply
    fi
fi

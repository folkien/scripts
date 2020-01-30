#!/bin/bash
# Git edycja N commitow na dotyłu gdzie N to pierwszy argument.
source /etc/messages.sh
NumberOfCommits=$1

# Check if local changes occured and have t ostage
localChanges=0
git status | grep "Changes not staged" > /dev/null
if [ $? -eq 0 ]; then
    localChanges=1
    git stash
fi


# Check regular expression to determine if hash given or value
re='^[0-9]+$'
if [[ $NumberOfCommits =~ $re ]] ; then
    minfo "Rebasing HEAD~${NumberOfCommits}."
    git rebase -i HEAD~${NumberOfCommits}
else
    minfo "Rebasing to rev ${NumberOfCommits}."
    git rebase -i ${NumberOfCommits}
fi

if [ $? -eq 0 ]; then
    if [ $localChanges -eq 1 ]; then
        git stash apply
    fi
fi

# Merge diff like gitlab diff of incoming changes.
currentBranch=$(git-branch-current)
mergeBranch="${1}"

git merge-tree $(git merge-base ${currentBranch} ${mergeBranch}) ${currentBranch} ${mergeBranch} | colordiff -y -p | less -R

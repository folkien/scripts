VERSION=$(date +%y%Vv%u)
RepoName=$(basename `git rev-parse --show-toplevel`)
Filename=${RepoName}${VERSION}.patch

#Checking if work is not stashed
# check of not commited 
git status | grep  "Changes not staged for commit"
if [ $? -eq 0 ]; then
    echo "Stashing local work!"
    git stash
fi
# check of changes to be commited
git status | grep  "Changes to be committed"
if [ $? -eq 0 ]; then
    echo "Stashing local work!"
    git stash
fi

git stash show -p > ${Filename}
if [ -z ${STASHDIRECTORY+x} ]; then
    echo "Stash directory is unset."
else
    cp -fv ${Filename} ${STASHDIRECTORY}/
fi


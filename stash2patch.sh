VERSION=$(date +%y%Vv%u)
#Checking if work is not stashed
git status | grep  "Changes not staged for commit"
if [ $? -eq 0 ]; then
    echo "Stashing local work!"
    git stash
fi
git stash show -p > ${VERSION}.patch
if [ -z ${STASHDIRECTORY+x} ]; then
    echo "Stash directory is unset."
else
    cp -fv ${VERSION}.patch ${STASHDIRECTORY}/
fi


VERSION=$(date +%y%Vv%u)
git stash
git stash show -p > ${VERSION}.patch
if [ -z ${STASHDIRECTORY+x} ]; then
    echo "Stash directory is unset."
else
    cp -fv ${VERSION}.patch ${STASHDIRECTORY}/
fi


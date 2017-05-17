source /etc/messages.sh
RepoName=$(basename `git rev-parse --show-toplevel`)

FILE=$(ls $STASHDIRECTORY | grep ${RepoName} | sort -r | head -n 1)
minfo "Last patch file is ${FILE}. Applying."
cp ${STASHDIRECTORY}/${FILE} ./
git apply ./${FILE}
if [ $? -ne 0 ]; then
    merror "Patch failed."
else
    msuccess "Patching completed!"
fi


source /etc/messages.sh
# get current repository name
RepoName=$(basename `git rev-parse --show-toplevel`)
# find last modified file with repository name
FILE=$(ls $STASHDIRECTORY | grep ${RepoName} | sort -r | head -n 1)

# Copy file to repository directory
minfo "Last patch file is ${FILE}. Applying."
cp ${STASHDIRECTORY}/${FILE} ./

# TODO 
# - check if tar.gz, then unpack
# - Apply commits first,
# - Apply stash secondly,
CommitsFile=""
StashFile=""


# Apply stash patch
git apply ./${FILE}
if [ $? -ne 0 ]; then
    merror "Patch failed."
else
    msuccess "Patching completed!"
fi


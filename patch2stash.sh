source /etc/messages.sh
# get current repository name
RepoName=$(basename `git rev-parse --show-toplevel`)
# find last modified file with repository name
FILE=$(ls $STASHDIRECTORY | grep ${RepoName} | sort -r | head -n 1)

# Clean all patches in current directory.
mkdir -p .old.patches
if [ -e *.patch ]; then
    mv ./*.patch .old.patches/
fi

# Copy file to repository directory
minfo "Last patch file is ${FILE}. Applying."
cp ${STASHDIRECTORY}/${FILE} ./

#unpack file
tar -xvf ${FILE}

# Apply commits.
git apply *.patch
if [ $? -ne 0 ]; then
    merror "Patch failed."
else
    msuccess "Patching completed!"

    # Clean
    echo "## Cleaning ##"
    rm *.patch
fi



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
if [ -e *.tar.gz ]; then
    mv ./*.tar.gz .old.patches/
fi

# Copy file to repository directory
minfo "Last patch file is ${FILE}. Applying."
cp ${STASHDIRECTORY}/${FILE} ./

#unpack file
tar -xvf ${FILE}

# Apply commits.
Commits=$(ls | grep "[0-9]*\-.*.patch")
git am --signoff --ignore-whitespace -3 < ${Commits}
if [ $? -ne 0 ]; then
    merror "Applying signoff patches failed."
    exit 1
else
    msuccess "Applying signoff patches completed!"
    # Clean commits
    echo "## Cleaning ##"
    rm -rfv ${Commits}
fi


# Apply stash patch
git apply --ignore-whitespace -3 *.patch
if [ $? -ne 0 ]; then
    merror "Stash Patch failed."
    exit 1
else
    msuccess "Stash Patching completed!"
    # Clean stash
    echo "## Cleaning ##"
    rm -rfv *.patch
fi

# reset HEAD to leave changes like previous stash
git reset HEAD

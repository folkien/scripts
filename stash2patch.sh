VERSION=$(date +%y%Vv%u)
RepoName=$(basename `git rev-parse --show-toplevel`)
FilePattern=${RepoName}${VERSION}
FilePackage=${FilePattern}.tar.gz
FileStash=${FilePattern}_stash.patch
FilesUnpushedCommits=""

# Clean all patches in current directory.
mkdir -p .old.patches
if [ -e *.patch ]; then
    mv ./*.patch .old.patches/
fi

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

#format-patches from last git-svn commit to this moment
echo "## Creating patch's from uncommited changes. ##"
git format-patch git-svn
FilesUnpushedCommits=$(ls *.patch)

# Append patch from current stash
echo "## Appending current stash to patch file. ##"
git stash show -p >> ${FileStash}

#pack everything together
echo "## Packing. ##"
tar -cvf ${FilePackage} ${FilesUnpushedCommits} ${FileStash}

#send to cloud
if [ -z ${STASHDIRECTORY+x} ]; then
    echo "Stash directory is unset."
else
    cp -fv ${FilePackage} ${STASHDIRECTORY}/
fi

# Clean
echo "## Cleaning ##"
rm *.patch

# End of work
echo "## Everything Done! ##"
echo ""

# question to ask before leave work
echo "Questions:"
read -e -p "Is PowerSupply taken? [y/n]"
read -e -p "Is device taken? [y/n]"
read -e -p "Is JTAG taken? [y/n]"


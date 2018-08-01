VERSION=$(date +%y%Vv%u)
RepoName=$(basename `git rev-parse --show-toplevel`)
Filepattern=${RepoName}${VERSION}

# Clean all patches in current directory.
mkdir -p .old.patches
[ -e *.patch ] && mv ./*.patch .old.patches/

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
cat *.patch > ${Filepattern}_patches.patch
rm *-*.patch

# Append patch from current stash
echo "## Appending current stash to patch file. ##"
git stash show -p >> ${Filepattern}_stash.patch

#pack everything together
echo "## Packing. ##"
tar -cvf ${Filepattern}.tar.gz ${Filepattern}_patches.patch ${Filepattern}_stash.patch

#send to cloud
if [ -z ${STASHDIRECTORY+x} ]; then
    echo "Stash directory is unset."
else
    cp -fv ${Filepattern}.tar.gz ${STASHDIRECTORY}/
fi

# End of work
echo "## Everything Done! ##"
echo ""

# question to ask before leave work
echo "Questions:"
read -e -p "Is PowerSupply taken? [y/n]"
read -e -p "Is device taken? [y/n]"
read -e -p "Is JTAG taken? [y/n]"


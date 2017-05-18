# Look for all commits fogotton
FILE_HASH=fogottenCommits
FILE_TEXT=forgottenCommitsText
git fsck --unreachable | grep commit > ${FILE_HASH}

echo "LOG:" > ${FILE_TEXT}
for f in $(cat ${FILE_HASH} )
do
    git show $f >> ${FILE_TEXT}
done

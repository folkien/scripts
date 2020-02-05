# Creates fix commit from current add and opens rebase dialog to squash it with previous commit.
git add -p
# Get filnames of adding files
files=""
while read filePath;
do
    file=$(echo ${filePath} | grep -o " .*")
    filename=$(basename ${file})
    files="${files}${filename}, "
done <<< $(git status -s | git status -s | grep -E "(A|AM|M|MM) .*")

git commit -m "Update of ${files}."
git-edit 3

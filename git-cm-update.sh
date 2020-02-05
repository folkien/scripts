# Creates fix commit from current add and opens rebase dialog to squash it with previous commit.
git add -p
# Get filnames of adding files
files=""
git status -s | grep "^A. .*" | while read -r filePath;
do
    file=$(echo ${filePath} | grep -o " .*")
    filename=$(basename ${file})
    files="${files}, ${filename}"
done
git commit -m "Update of ${files}."
git-edit 3

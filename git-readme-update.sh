#Path directory check
readmePath="README.md"
pwd | grep Sources
[ $? -eq 0 ] && readmePath="../${readmePath}"

# Last commit message
lastCommitMessage=$(git log --pretty=oneline | head -n 1)
echo "*    commit ${lastCommitMessage}" >> ${readmePath}

# open Readme to edit
gvim -f ${readmePath}

# Create readme update commit
description=$(git diff ${readmePath} | grep "+.*commit" | grep "commit.*" -o)
git add ${readmePath}
git commit -m "README.md update about ${description}."


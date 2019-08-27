

#Path directory check
readmePath="README.md"
pwd | grep Sources
[ $? -eq 0 ] && readmePath="../${readmePath}"

gvim -f ${readmePath}
description=$(git diff ${readmePath} | grep "+.*commit" | grep "commit.*" -o)
git add ${readmePath}
git commit -m "README.md update about ${description}."


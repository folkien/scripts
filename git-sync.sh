[ ! -e .git  ] && exit 0
stashBefore=$(git stash | wc -l)
git stash 
stashAfter=$(git stash | wc -l)
git pull --rebase && git push 
[ ! ${stashBefore} -eq ${stashAfter} ] && git stash apply
echo 'Updated log :' && git log --pretty=oneline | head -n 5

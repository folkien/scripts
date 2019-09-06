git status
[ $? -ne 0 ] && exit 0
source /etc/messages.sh
stashBefore=$(git stash | wc -l)
git stash 
stashAfter=$(git stash | wc -l)
git pull --rebase
git push 
[ ! ${stashBefore} -eq ${stashAfter} ] && git stash apply
minfo 'Updated log :' && git log --pretty=oneline | head -n 5

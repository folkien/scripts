source /etc/messages.sh

# Check status
git status
[ $? -ne 0 ] && exit 0

# Get branch name
branch=$(git rev-parse --abbrev-ref HEAD)

git stash

# Number of diffrent commits
diffrence=$(git log --oneline origin/${branch}..${branch} | wc -l)

# Synchronize data
git pull --rebase
git push 

git stash apply
minfo 'Updated log :' && git log --pretty=oneline | head -n 5

source /etc/messages.sh

# Exit if not git repository
[ $(git-is-repository) -eq 0 ] && echo "Not git repository!" && exit -1

# Get branch name
branch=$(git rev-parse --abbrev-ref HEAD)
# Get if there are local changes
localChanges=$(git-are-changes)
# Number of diffrent commits
diffrence=$(git log --oneline origin/${branch}..${branch} | wc -l)


[ ${localChanges} -eq 1 ] && git stash
# Synchronize data
git pull --rebase
git push 
[ ${localChanges} -eq 1 ] && echo "Applying stash!" && git stash apply > /dev/null

minfo "Pushed changes:"
#TODO
minfo "Pulled changes"
# TODO

minfo 'Updated log :' && git log --pretty=oneline | head -n 5

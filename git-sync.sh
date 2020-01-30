source /etc/messages.sh

# Exit if not git repository
[ $(git-is-repository) -eq 0 ] && echo "Not git repository!" && exit -1

# Get branch name
branch=$(git rev-parse --abbrev-ref HEAD)
# Get if there are local changes
localChanges=$(git-are-changes)
# Number of diffrent commits
diffrence=$(git log --oneline origin/${branch}..${branch} | wc -l)
# local top commit
localTop=$(git rev-parse HEAD)
# last pushed top commit
pushedTop=$(git rev-parse origin/${branch})
git fetch origin ${branch}
# last origin top commit
originTop=$(git rev-parse origin/${branch})



[ ${localChanges} -eq 1 ] && git stash
# Synchronize data
git pull --rebase
git push 
[ ${localChanges} -eq 1 ] && echo "Applying stash!" && git stash apply > /dev/null

minfo "Pushed changes:"
git log --pretty=oneline ${originTop}..${localTop}
minfo "Pulled changes"
git log --pretty=oneline ${pushedTop}..${originTop}
minfo 'Updated log :' && git log --pretty=oneline | head -n 5

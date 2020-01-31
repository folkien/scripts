source /etc/messages.sh

# Arguments check
if [ $# -eq 1 ]; then
    parameter="${1}"
fi

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
git fetch origin ${branch} &> /dev/null
# last origin top commit
originTop=$(git rev-parse origin/${branch})



[ ${localChanges} -eq 1 ] && mwarning "Stashed." && git stash
# Synchronize data
git pull --rebase
resultPullRebase="$?"
git push 
[ ${localChanges} -eq 1 ] && mwarning "Applying stash..." && git stash pop > /dev/null
resultStashPop="$?"

minfo "Pushed changes:"
git log --pretty=oneline ${originTop}..${localTop}
minfo "Pulled changes"
git log --pretty=oneline ${pushedTop}..${originTop}

# Debuging messages
if [ "${parameter}" = "debug" ]; then
    echo "local top ${localTop}"
    echo "last pushed top ${pushedTop}"
    echo "origin top ${originTop}"
fi

# Result code 0 - if everything happend well
if [ ${resultPullRebase} -eq 0 ] && [ ${resultStashPop} -eq 0 ]; then
    msuccess "0"
    exit 0
fi
merror "-1"
exit -1

source /etc/messages.sh

# Arguments check
if [ $# -eq 1 ]; then
    parameter="${1}"
fi

# Exit if not git repository
[ $(git-is-repository) -eq 0 ] && echo "Not git repository!" && exit -1

# Default operations results
resultPull=-1
resultPush=-1
resultStashPop=0
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

# Debuging messages
if [ "${parameter}" = "debug" ]; then
    echo "local top ${localTop}"
    echo "last pushed top ${pushedTop}"
    echo "origin top ${originTop}"
fi

# Stash - hide
[ ${localChanges} -eq 1 ] && mwarning "Stashed." && git stash
# Pull data
git pull --rebase
resultPull="$?"
# If pull succesfull then push and apply stash
if [ ${resultPull} -eq 0 ]; then
    git push
    resultPush="$?"
    # Stash - apply
    if [ ${localChanges} -eq 1 ]; then
        mwarning "Applying stash..." 
        git stash pop > /dev/null
        resultStashPop="$?"
    fi
else
    merror "Pull rebase with error/conflict!"
fi

[ ${resultPull} ] && minfo "Pulled <-- changes:" && git log --pretty=oneline ${pushedTop}..${originTop}
[ ${resultPush} -eq 0 ] && minfo "Pushed --> changes:" && git log --pretty=oneline ${originTop}..${localTop}

# Result code 0 - if everything happend well
if [ ${resultPull} -eq 0 ] && [ ${resultStashPop} -eq 0 ]; then
    msuccess "Success!"
    exit 0
fi
merror "Failed!"
exit -1

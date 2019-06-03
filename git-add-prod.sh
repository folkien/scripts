# Git add to prod

# Do not run with local changes
git status | grep "not staged for"
if [ $? -eq 0 ]; then
    echo "Stash your changes!"
    exit 1
fi

# Get master commits
g co master
mapfile -t commits < <(git log --pretty="format:%h %ae %s" --decorate -n 10)
commitLine=$(dialog --title "Last 10 commits" --menu "Chose one" 24 80 17 "${commits[@]}" 3>&2 2>&1 1>&3) # show dialog and store output
commit=$(echo $commitLine | cut -c -7)


# Get prod branches
mapfile -t prodBranches < <(git branch -a | grep prod\..* -o | trim | sort | uniq)
selectedBranch=$(dialog --title "Production branches" --menu "Chose one" 24 80 17 "${prodBranches[@]}" 3>&2 2>&1 1>&3) # show dialog and store output
echo "Commit ${commit} add to ${selectedBranch}."

#


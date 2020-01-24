#
# Get git difftool
difftool=$(git config --global diff.tool)

# Give revision and file path
if [ $# -gt 1 ]; then
    revision="$1"
    filepath="$2"
# Give file path
else
    filepath="$1"
fi

git blame ${filepath} > "local.blame"
git blame ${revision} -- ${filepath} > "remote.blame"
${difftool} "local.blame" "remote.blame"
rm -rf *.blame

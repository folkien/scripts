#
# Find newest/latest file in directory.
dir="./"
if [ $# -gt 0 ]; then
    dir="$@"
fi

latest=""
for file in "$dir"/*; do
  [[ $file -nt $latest ]] && latest=$file
done
echo ${latest}

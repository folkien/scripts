#
# Find oldest file in directory.
dir="./"
if [ $# -gt 0 ]; then
    dir="$@"
fi

latest=""
for file in "$dir"/*; do
  [[ $latest == "" ]] && latest=$file
  [[ $file -ot $latest ]] && latest=$file
done
echo ${latest}

if [ $# -lt 1 ]; then
    echo "Called on current directory. Give only sed argument"
    exit -1
fi
#
# assertion to not modify git repository hidden files
ls .git &> /dev/null
if [ $? == 0 ]; then
    echo "Here is .git repository! You cannot use this command in this folder!"
    exit -1
fi
# loop through all files inside directory and call sed with given parameters
find ./ -type f -print0 | xargs -0 sed -i -E $@

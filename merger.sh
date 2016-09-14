[ $# -eq 0 ] && echo "Please give commit hash." && exit 0
commit="$@"
ignorefiles=[]
n=0
commit_number=0

echo "" > run_apply.log
echo "" > run_ignored.log
git log $commit.. --pretty=oneline > run_all.log

commitsamount=$(cat run_all.log | wc -l)
echo "We have to work about $commitsamount commits. Let's start."
for commithash in $(git log $commit.. --pretty=oneline | tac | cut -c -40)
do

    ignorecommit=0
    for filename in $(git show $commithash | grep "+++" | cut -c 7- )
    do
        ignorefile=0
        echo  "Number n : $n "
        if [ $n -gt 0 ]; then
            for i in $(seq 0 1 $(($n-1)) )
            do
                cmp=${ignorefiles[$i]}
                echo "cmp[$i] $cmp"
                if [ ${ignorefiles[$i]} = $filename ]; then
                    # ignore
                    echo "File ignored."
                    ignorefile=1
                    ignorecommit=1
                fi
            done
        fi
        if [ $ignorefile -eq 0 ]; then
            commithashandtext=$(git log --pretty=oneline $commithash -1)
            dialog --title "$commit_number / $commitsamount Commit ignore file? - Escape to exit." \
                    --yesno "$commithashandtext \n\nIgnore file:./$filename ?\n\nPaths on ignorelist $n." 15 80
                response=$?
                case $response in
                    0)
                        # Ignore and add to list
                        ignorefiles[$n]=$filename
                        n=$(($n+1))
                        ignorecommit=1
                        echo "Added to ignore list."
                        ;;
                    1) ;;
                    255)
                        echo "Interrupted merge!"
                        exit -1;
                        ;;
                esac
        fi
    done
    if [ $ignorecommit -eq 0 ]; then
        echo "Commit $commithash applyied."
        echo "git cherry-pick $commithash" >> run_apply.log
    else
        echo "Commit $commithash ignored."
        echo "Ignored $commithash" >> run_ignored.log
    fi
    commit_number=$(($commit_number+1))
done


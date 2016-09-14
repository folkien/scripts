commit="fd982c3b33f9692388f53f78b158388947a27149"
ignorefiles=[]
n=0

echo "" > run_apply.log
echo "" > run_ignored.log

for commithash in $(git log $commit.. | grep commit | cut -c 8-)
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
            dialog --title "Commit ignore file? " \
                    --yesno "$commithashandtext \n\nIgnore file:./$filename ?" 15 80
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
done


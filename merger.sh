commit="fd982c3b33f9692388f53f78b158388947a27149"
ignorefiles=[]
n=0

for commithash in $(git log $commit.. | grep commit | cut -c 8-)
do

    for filename in $(git show $commithash | grep "+++" | cut -c 7- )
    do
        ignore=0
        echo  "Number n : $n "
        if [ $n -gt 0 ]; then
            for i in $(seq 0 1 $(($n-1)) )
            do
                cmp=${ignorefiles[$i]}
                echo "cmp[$i] $cmp"
                if [ ${ignorefiles[$i]} = $filename ]; then
                    ignore=1
                fi
            done
        fi
        if [ $ignore -eq 0 ]; then
            echo "Test"
                dialog --title "Ignore file" \
                    --yesno "Ignore file $filename ?" 7 60
                response=$?
                case $response in
                    0)
                        ignorefiles[$n]=$filename
                        n=$(($n+1))
                        echo "Added to ignore list."
                        ;;
                    1) ;;
                esac
        fi
    done
done


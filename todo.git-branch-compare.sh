#! /bin/bash
if ((2==$#)); then
  a=$1
  b=$2
  alog=$(echo $a | tr '/' '-').log
  blog=$(echo $b | tr '/' '-').log
  git log --oneline $a > $alog
  git log --oneline $b > $blog
  # Remove same commits
  while IFS= read -r line; do
      # Get commit description
      desc=$(echo "$line" | cut -c 8-)
      # find in second log
      grep "${desc}" $blog
      # if found
      if [ $? -eq 0 ]; then
        sed  -i "s/.*${desc}.*//g" $alog
        sed  -i "s/.*${desc}.*//g" $blog
      fi
  done < "$alog"
  #
  meld $alog $blog
fi

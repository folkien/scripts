#!/bin/bash

modsecs=$(date --utc --reference=.lastBuildConfiguration +%s)
nowsecs=$(date +%s)
delta=$(($nowsecs-$modsecs))
echo "File $filename was modified $delta secs ago"

if [ $delta -lt 120 ]; then
  # do something
fi
directory=$(filelist ./)


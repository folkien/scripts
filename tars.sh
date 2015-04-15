#!/bin/bash
# Skrypt do progress-bar dla tar.
INPUT=$1
OUTPUT=$2
tar cf - $INPUT | pv -s `du -sb . | grep -o '[0-9]\+'` -N tar  | xz > $OUTPUT

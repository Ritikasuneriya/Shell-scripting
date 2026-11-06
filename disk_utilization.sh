#!/bin/bash

THRESHOLD=80

echo "===== Disk Utilization Report ====="

df -h | awk 'NR==1 || $1 ~ "^/dev/"'

echo " "

df -P | awk -v threshold="$THRESHOLD" '
NR > 1 {
    usage = $5
    gsub("%", "", usage)

    if (usage > threshold) {
        print "WARNING: Disk usage is high!"
        print "Filesystem:", $1
        print "Mount Point:", $6
        print "Disk Usage:", usage "%"
    }
}'

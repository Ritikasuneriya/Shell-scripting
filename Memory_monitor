#!/bin/bash

echo "===== Memory Utilization Report ====="

TOTAL_MEM=$(free -m | awk '/Mem:/ {print $2}')
USED_MEM=$(free -m | awk '/Mem:/ {print $3}')
FREE_MEM=$(free -m | awk '/Mem:/ {print $4}')

MEM_USAGE=$(awk -v used="$USED_MEM" -v total="$TOTAL_MEM" \
'BEGIN {printf "%.2f", (used/total)*100}')

echo "Total Memory: ${TOTAL_MEM} MB"
echo "Used Memory: ${USED_MEM} MB"
echo "Free Memory: ${FREE_MEM} MB"
echo "Memory Utilization: ${MEM_USAGE}%"

if (( $(echo "$MEM_USAGE > 80" | bc -l) )); then
    echo "WARNING: High Memory Utilization!"
else
    echo "Memory Utilization is Normal."
fi

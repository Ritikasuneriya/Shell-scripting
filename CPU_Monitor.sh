#!/bin/bash

echo "===== CPU Utilization Report ====="

CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')

CPU_USAGE=$(awk -v idle="$CPU_IDLE" 'BEGIN {printf "%.2f", 100-idle}')

echo "CPU Usage: $CPU_USAGE%"

if (( $(echo "$CPU_USAGE > 80" | bc -l) )); then
    echo "WARNING: High CPU Utilization!"
else
    echo "CPU Utilization is Normal."
fi

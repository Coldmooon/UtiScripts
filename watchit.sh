#!/bin/bash
PID=$1
TODO=$2
while [[ ( -d /proc/$PID ) && ( -z `grep zombie /proc/$PID/status` ) ]]; do
    echo "the process $PID is runing"
    sleep 3
done

echo "$PID is complete!"
echo "Start running another command!"

$TODO
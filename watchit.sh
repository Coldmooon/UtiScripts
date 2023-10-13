#!/bin/bash

# Before run this script. Please check the following things:
#   1. Please check your conda env. Make sure that the command you are going to run is under the desired conda env.
#   2. Please check if the command you are going to run has the execute permission. If it doesn't have the execute permission, use `chmod +x` to grant it.

PID=$1
TODO=$2
while [[ ( -d /proc/$PID ) && ( -z `grep zombie /proc/$PID/status` ) ]]; do
    echo "the process $PID is runing"
    sleep 3
done

echo "$PID is complete!"
echo "Start running another command!"

$TODO

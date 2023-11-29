#!/bin/bash

# File to store the last IP address
LAST_IP_FILE="/home/liyang/last_ip.txt"

# Get the current IP address
CURRENT_IP=$(hostname -I | cut -d' ' -f1)
HOST_NAME=$(hostname)

# Read the last IP address from file
if [ -f "$LAST_IP_FILE" ]; then
    LAST_IP=$(cat "$LAST_IP_FILE")
else
    LAST_IP=""
fi

# Compare the current IP address with the last known IP address
if [ "$CURRENT_IP" != "$LAST_IP" ]; then
    # IP has changed, update the file and send an email
    echo "$CURRENT_IP" > "$LAST_IP_FILE"
    echo -e "To: myannli@163.com\nFrom: myannli@163.com\nSubject: ${HOST_NAME}: New IP Address\n\nLocal IP Address has changed to: $CURRENT_IP" | /usr/sbin/ssmtp myannli@163.com
fi


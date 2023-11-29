#!/bin/bash

HOSTNAME=$(hostname)
IP=$(hostname -I | cut -d' ' -f1)
echo -e "To: myannli@163.com\nFrom: myannli@163.com\nSubject: ${HOSTNAME}: Local IP Address\n\nLocal IP Address: $IP" | /usr/sbin/ssmtp myannli@163.com

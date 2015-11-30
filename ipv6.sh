#!/bin/sh
IFNAME="en5"
PREFIXINFO=`/usr/sbin/tcpdump -nvi $IFNAME -c 2 icmp6 | grep prefix`
PREFIX=`echo $PREFIXINFO|cut -f2- -d:|cut -f1 -d/|cut -c2-`
PREFIXLEN=`echo $PREFIXINFO|cut -f2 -d/|cut -f1 -d,`
ADDR="cafe"
 
/sbin/ifconfig $IFNAME inet6 ${PREFIX}${ADDR}/$PREFIXLEN
/sbin/route add -inet6 default -interface $IFNAME
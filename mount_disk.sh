#!/bin/sh

show_usage () {
echo "
********************************************
This script is used to mount/unmount disks.

Usage: $0 [mount | unmount].
********************************************"
}

if [ "$#" -ne 1 ] || [ "$1" != "mount" ] && [ "$1" != "unmount" ];
then
        show_usage
        exit 1
fi

op=$1

udisksctl $op -b /dev/sdd1
udisksctl $op -b /dev/sdc1
udisksctl $op -b /dev/sda1
udisksctl $op -b /dev/sda4
udisksctl $op -b /dev/sda5
udisksctl $op -b /dev/sda6
udisksctl $op -b /dev/sda7

echo "done!"

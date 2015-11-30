#!/bin/bash

for((i=1;i<255;i++));
do
	for ((j=1;j<255;j++));
	do
        a=10.104.$i.$j
        (ping -i 0.1 -c 1 $a > /dev/null 2>&1) && echo $a is used || echo $a is unused
    done
done
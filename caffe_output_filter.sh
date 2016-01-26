#!/bin/bash
# This script is used to extract loss or accuracy values from the outputs of Caffe.
# Usage:
# caffe_output_filter.sh [train|test] [loss|top1|top5] file
# -----------
show_usage () {
	echo
	echo "********************************************"
	echo Usage: $0 \<option\(s\)\> SOURCE
	echo caffe_output_filter.sh \[train\|test\] \[loss\|top1\|top5\] file.
	echo Options:
	echo "    train|test: specify the stage of CNN."
	echo "    loss|top1|top5: extract loss or accuracy." 
	echo "    file: the output of caffe."
	echo Example: caffe_output_filter.sh train top1 caffe_output.txt 
	echo "********************************************"
}
if [ "$1" = "train" ];
then
	phase=Train
elif [ "$1" = "test" ]
then
	phase=Test
else
	show_usage
	exit 1
fi

if [ "$2" = "loss" ];
then
	obj=0
elif [ "$2" = "top1" ]
then
	obj=1
elif [ "$2" = "top5" ]
then
	obj=2
else
	show_usage
	exit 1
fi

if [ -z $3 ];
then
	show_usage
	exit 1
elif [ -f $3 ];
then
	log=$3
else
	show_usage
	exit 1
fi

cat ${log} | grep "${phase} net output #${obj}" | cut -d "=" -f 2 | cut -d " " -f 2

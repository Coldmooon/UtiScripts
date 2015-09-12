#!/bin/bash
# http://stackoverflow.com/questions/10929453/bash-scripting-read-file-line-by-line
# http://zhangliliang.com/2014/07/02/about-command-at-linux/
count=0
while IFS='' read -r line || [[ -n "$line" ]]; do
    # echo "Text read from file: $line"
    (( COUNTER++ ))
    convert $line -colorspace RGB $line

    b=$(( $COUNTER % 1000 ))
	if [ $b = 0 ] ; then 
	    echo "processed" $b
	fi
done < "$1"

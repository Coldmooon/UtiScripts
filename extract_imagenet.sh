#!/bin/bash
PATH2012="/home/coldmoon/Datasets/ISLVRC2012"
num_files=$(ls -l ${PATH2012} | grep "^-" | wc -l)
index=1
for name in ${PATH2012}/*.tar; do
    cd PATH2012
    echo "${name}: ${index}/${num_files}"
    filename=${name##*/}
    pure_filename=${filename%.*}
    echo "mkdiring" $pure_filename
    mkdir $pure_filename
    cd $pure_filename
    tar xvf ../$filename
    ((index++));
done

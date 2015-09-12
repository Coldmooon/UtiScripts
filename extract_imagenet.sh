#!/bin/bash

# for name in /media/coldmoon/高清影视/data/*.tar; do
#     cd /media/coldmoon/高清影视/data/
for name in /home/coldmoon/Datasets/ISLVRC_2012/*.tar; do
    cd /home/coldmoon/Datasets/ISLVRC_2012/
    echo $name
    filename=${name##*/}
    pure_filename=${filename%.*}
    echo "mkdiring" $pure_filename
    mkdir $pure_filename
    cd $pure_filename
    tar xvf ../$filename;
done

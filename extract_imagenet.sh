#!/bin/bash
PATH2012="/home/coldmoon/Datasets/ILSVRC2012"
filetype="tar"

if [ ! -d $PATH2012 ]; then
  echo "ERROR: ${PATH2012} doesn't exist."
  exit 1
fi
num_files=$(ls -l ${PATH2012}/*.${filetype} | grep "^-" | wc -l)
index=1
for name in ${PATH2012}/*.${filetype}; do
    cd $PATH2012
    echo "${name}: ${index}/${num_files}"
    filename=${name##*/}
    pure_filename=${filename%.*}
    echo "mkdiring" $pure_filename
    mkdir $pure_filename
    cd $pure_filename
    tar xvf ../$filename
    ((index++));
done

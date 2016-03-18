#!/bin/bash
#FILES=$1/scripts/*
FILES=`find $1/scripts -name "*.lua"`
TEMP=$1/tempFILE
for f in $FILES
do
    luamin -f $f > $TEMP
    cat $TEMP > $f
    #echo "Processing $f file..."
    # take action on each file. $f store current file name
    #cat $f
done

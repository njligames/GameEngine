#!/bin/bash
FILENAME=checkerboard.gif
N=32
PIXEL_WIDTH=2048

echo "Generating a " $((PIXEL_WIDTH))x$((PIXEL_WIDTH)) " checkerboard."
echo "Tiles = " $((N))x$((N)) 
echo "Output file = " $FILENAME

convert -size $((PIXEL_WIDTH))x$((PIXEL_WIDTH)) xc:white $FILENAME
convert -size $((N))x$((N)) xc:black black.gif

X=0
Y=0
INC=0
offset=0
while [ $Y -lt $PIXEL_WIDTH ]; do
    let X=offset
    while [ $X -lt $PIXEL_WIDTH ]; do
        composite -geometry +$((X))+$((Y)) black.gif $FILENAME $FILENAME
        let X=X+$((N*2))
    done
    let INC=INC+1
    let offset=$((INC%2))
    let offset=$((offset*N))
    let Y=Y+$((N))
done

rm black.gif
open $FILENAME

#!/bin/bash
#FILENAME=Checkerboard_2048x2048.gif
#X=0
#Y=0
#INC=0
#offset=0
#N=8
#PIXEL_WIDTH=2048

COLOR=(FC0F1D FDA428 FFFD38 0F7F12 0B24FB 7F0F7E FFFFFF FC0F1D FDA428 FFFD38 0F7F12 0B24FB 7F0F7E FFFFFF FC0F1D FDA428 FFFD38 0F7F12 0B24FB 7F0F7E FFFFFF FC0F1D FDA428 FFFD38 0F7F12 0B24FB 7F0F7E FFFFFF FC0F1D FDA428 FFFD38 0F7F12 0B24FB 7F0F7E FFFFFF FC0F1D FDA428 FFFD38 0F7F12 0B24FB 7F0F7E FFFFFF)
COMPLEMENT=(1ffc0f 4b28fd fc38ff 7f0f0f fb7b0b 7d7f0f 000000 1ffc0f 4b28fd fc38ff 7f0f0f fb7b0b 7d7f0f 000000 1ffc0f 4b28fd fc38ff 7f0f0f fb7b0b 7d7f0f 000000 1ffc0f 4b28fd fc38ff 7f0f0f fb7b0b 7d7f0f 000000 1ffc0f 4b28fd fc38ff 7f0f0f fb7b0b 7d7f0f 000000 1ffc0f 4b28fd fc38ff 7f0f0f fb7b0b 7d7f0f 000000)

createTile()
{
#let N=8
#let PIXEL_WIDTH=$((N*2))
N=$1
IDX0=$2
IDX1=$3
PIXEL_WIDTH=$((N*2))

convert -size $((N))x$((N)) xc:#${COLOR[$IDX0]} $((N))x$((N))_tile_$((IDX0 % 4)).gif
convert -size $((N*2))x$((N*2)) xc:#${COMPLEMENT[$IDX0]} $((N))x$((N))_$((IDX0 % 4)).gif

X=0
Y=0
INC=0
offset=0
while [ $Y -lt $PIXEL_WIDTH ]; do
    let X=offset
    while [ $X -lt $PIXEL_WIDTH ]; do
        composite -geometry +$((X))+$((Y)) $((N))x$((N))_tile_$((IDX0 % 4)).gif $((N))x$((N))_$((IDX0 % 4)).gif $((N))x$((N))_$((IDX0 % 4)).gif
        let X=X+$((N*2))
    done
    let INC=INC+1
    let offset=$((INC%2))
    let offset=$((offset*N))
    let Y=Y+$((N))
done

convert -size $((N))x$((N)) xc:#${COLOR[$IDX1]} $((N))x$((N))_tile_$((IDX1 % 4)).gif
convert -size $((N*2))x$((N*2)) xc:#${COMPLEMENT[$IDX1]} $((N))x$((N))_$((IDX1 % 4)).gif

let X=0
let Y=0
let INC=0
let offset=0
while [ $Y -lt $PIXEL_WIDTH ]; do
    let X=offset
    while [ $X -lt $PIXEL_WIDTH ]; do
        composite -geometry +$((X))+$((Y)) $((N))x$((N))_tile_$((IDX1 % 4)).gif $((N))x$((N))_$((IDX1 % 4)).gif $((N))x$((N))_$((IDX1 % 4)).gif
        let X=X+$((N*2))
    done
    let INC=INC+1
    let offset=$((INC%2))
    let offset=$((offset*N))
    let Y=Y+$((N))
done

rm $((N))x$((N))_tile_$((IDX0 % 4)).gif
rm $((N))x$((N))_tile_$((IDX1 % 4)).gif

}

createTile 8 1 2
createTile 8 3 4

createTile 16 5 6
createTile 16 7 8

createTile 32 9 10
createTile 32 11 12

createTile 64 13 14
createTile 64 15 16

createTile 128 17 18
createTile 128 19 20

createTile 256 21 22
createTile 256 23 24

createTile 512 25 26
createTile 512 27 28

createTile 1024 29 30
createTile 1024 31 32

createTile 2048 33 34
createTile 2048 35 36



composeTile()
{
N=$1
PIXEL_WIDTH=$((N*4))
let X=0
let Y=0
let INC=0
let offset=0

while [ $Y -lt $PIXEL_WIDTH ]; do
    let X=0
    while [ $X -lt $PIXEL_WIDTH ]; do
        composite -geometry +$((X))+$((Y)) $((N))x$((N))_$((INC%2)).gif $((N*2))x$((N*2))_0.gif $((N*2))x$((N*2))_0.gif
        let X=X+$((N*2))
        composite -geometry +$((X))+$((Y)) $((N))x$((N))_$(((INC+1)%2)).gif $((N*2))x$((N*2))_0.gif $((N*2))x$((N*2))_0.gif
        let X=X+$((N*2))
        let INC=$INC+1
    done

    let Y=Y+$((N*2))
done

let INC=0
while [ $Y -lt $PIXEL_WIDTH ]; do
    let X=0
    while [ $X -lt $PIXEL_WIDTH ]; do
        composite -geometry +$((X))+$((Y)) $((N))x$((N))_$((INC%2)).gif $((N*2))x$((N*2))_1.gif $((N*2))x$((N*2))_1.gif
        let X=X+$((N*2))
        composite -geometry +$((X))+$((Y)) $((N))x$((N))_$(((INC+1)%2)).gif $((N*2))x$((N*2))_1.gif $((N*2))x$((N*2))_1.gif
        let X=X+$((N*2))
        let INC=$INC+1
    done

    let Y=Y+$((N*2))
done
}


composeTile 8
composeTile 16
composeTile 32
composeTile 64
composeTile 128
composeTile 256
composeTile 512
composeTile 1024
composeTile 2048

#convert -size $((N))x$((N)) xc:#FC0F1D $((N))x$((N))_tile_0.gif
#convert -size $((N*2))x$((N*2)) xc:#1ffc0f $((N))x$((N))_canvas_0.gif

#convert -size 16x16 xc:#FDA428 16x16_tile.gif #ORANGE
#convert -size 32x32 xc:#4b28fd 16x16_canvas.gif
#
#convert -size 32x32 xc:#FFFD38 32x32_tile.gif #YELLOW
#convert -size 64x64 xc:#fc38ff 32x32_canvas.gif
#
#convert -size 64x64 xc:#0F7F12 64x64_tile.gif #GREEN
#convert -size 128x128 xc:#7f0f0f 64x64_canvas.gif
#
#convert -size 128x128 xc:#0B24FB 128x128_tile.gif #BLUE
#convert -size 256x256 xc:#fb7b0b 128x128_canvas.gif
#
#convert -size 256x256 xc:#7F0F7E 256x256_tile.gif #PURPLE
#convert -size 512x512 xc:#7d7f0f 256x256_canvas.gif
#
#convert -size 512x512 xc:white 512x512_tile.gif #WHITE
#convert -size 1024x1024 xc:black 512x512_canvas.gif
#
#convert -size 1024x1024 xc:#FC0F1D 1024x1024_tile.gif #RED
#convert -size 2048x2048 xc:#1ffc0f 1024x1024_canvas.gif
#
#convert -size 2048x2048 xc:#FDA428 2048x2048_tile.gif #ORANGE
#convert -size 2048x2048 xc:#4b28fd 2048x2048_canvas.gif

























#X=0
#Y=0
#INC=0
#offset=0
#N=8
#PIXEL_WIDTH=2048
#while [ $Y -lt $PIXEL_WIDTH ]; do
    #let X=offset
    #while [ $X -lt $PIXEL_WIDTH ]; do
        #composite -geometry +$((X))+$((Y)) red.gif $FILENAME $FILENAME
        #let X=X+$((N*2))
    #done
    #let INC=INC+1
    #let offset=$((INC%2))
    #let offset=$((offset*N))
    #let Y=Y+$((N))
#done
#
#let X=0
#let Y=0
#let INC=0
#let offset=0
#let N=16
#let PIXEL_WIDTH=2048
#while [ $Y -lt $PIXEL_WIDTH ]; do
    #let X=offset
    #while [ $X -lt $PIXEL_WIDTH ]; do
        #composite -geometry +$((X))+$((Y)) orange.gif $FILENAME $FILENAME
        #let X=X+$((N*2))
    #done
    #let INC=INC+1
    #let offset=$((INC%2))
    #let offset=$((offset*N))
    #let Y=Y+$((N))
#done
#
#let X=0
#let Y=0
#let INC=0
#let offset=0
#let N=32
#let PIXEL_WIDTH=2048
#while [ $Y -lt $PIXEL_WIDTH ]; do
    #let X=offset
    #while [ $X -lt $PIXEL_WIDTH ]; do
        #composite -geometry +$((X))+$((Y)) yellow.gif $FILENAME $FILENAME
        #let X=X+$((N*2))
    #done
    #let INC=INC+1
    #let offset=$((INC%2))
    #let offset=$((offset*N))
    #let Y=Y+$((N))
#done
#
#let X=0
#let Y=0
#let INC=0
#let offset=0
#let N=64
#let PIXEL_WIDTH=2048
#while [ $Y -lt $PIXEL_WIDTH ]; do
    #let X=offset
    #while [ $X -lt $PIXEL_WIDTH ]; do
        #composite -geometry +$((X))+$((Y)) green.gif $FILENAME $FILENAME
        #let X=X+$((N*2))
    #done
    #let INC=INC+1
    #let offset=$((INC%2))
    #let offset=$((offset*N))
    #let Y=Y+$((N))
#done
#
#let X=0
#let Y=0
#let INC=0
#let offset=0
#let N=128
#let PIXEL_WIDTH=2048
#while [ $Y -lt $PIXEL_WIDTH ]; do
    #let X=offset
    #while [ $X -lt $PIXEL_WIDTH ]; do
        #composite -geometry +$((X))+$((Y)) blue.gif $FILENAME $FILENAME
        #let X=X+$((N*2))
    #done
    #let INC=INC+1
    #let offset=$((INC%2))
    #let offset=$((offset*N))
    #let Y=Y+$((N))
#done
#
#let X=0
#let Y=0
#let INC=0
#let offset=0
#let N=256
#let PIXEL_WIDTH=2048
#while [ $Y -lt $PIXEL_WIDTH ]; do
    #let X=offset
    #while [ $X -lt $PIXEL_WIDTH ]; do
        #composite -geometry +$((X))+$((Y)) purple.gif $FILENAME $FILENAME
        #let X=X+$((N*2))
    #done
    #let INC=INC+1
    #let offset=$((INC%2))
    #let offset=$((offset*N))
    #let Y=Y+$((N))
#done
#
#let X=0
#let Y=0
#let INC=0
#let offset=0
#let N=512
#let PIXEL_WIDTH=2048
#while [ $Y -lt $PIXEL_WIDTH ]; do
    #let X=offset
    #while [ $X -lt $PIXEL_WIDTH ]; do
        #composite -geometry +$((X))+$((Y)) white.gif $FILENAME $FILENAME
        #let X=X+$((N*2))
    #done
    #let INC=INC+1
    #let offset=$((INC%2))
    #let offset=$((offset*N))
    #let Y=Y+$((N))
#done
#
#let X=0
#let Y=0
#let INC=0
#let offset=0
#let N=1024
#let PIXEL_WIDTH=2048
#while [ $Y -lt $PIXEL_WIDTH ]; do
    #let X=offset
    #while [ $X -lt $PIXEL_WIDTH ]; do
        #composite -geometry +$((X))+$((Y)) gray.gif $FILENAME $FILENAME
        #let X=X+$((N*2))
    #done
    #let INC=INC+1
    #let offset=$((INC%2))
    #let offset=$((offset*N))
    #let Y=Y+$((N))
#done
#
#FILENAME=checkerboard.gif
#N=32
#PIXEL_WIDTH=2048
#
#echo "Generating a " $((PIXEL_WIDTH))x$((PIXEL_WIDTH)) " checkerboard."
#echo "Tiles = " $((N))x$((N)) 
#echo "Output file = " $FILENAME
#
#convert -size $((PIXEL_WIDTH))x$((PIXEL_WIDTH)) xc:white $FILENAME
#convert -size $((N))x$((N)) xc:black black.gif
#
#X=0
#Y=0
#INC=0
#offset=0
#while [ $Y -lt $PIXEL_WIDTH ]; do
    #let X=offset
    #while [ $X -lt $PIXEL_WIDTH ]; do
        #composite -geometry +$((X))+$((Y)) black.gif $FILENAME $FILENAME
        #let X=X+$((N*2))
    #done
    #let INC=INC+1
    #let offset=$((INC%2))
    #let offset=$((offset*N))
    #let Y=Y+$((N))
#done
#
#rm black.gif
#open $FILENAME

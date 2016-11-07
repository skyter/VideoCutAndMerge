#!/bin/bash

echo "Usage: ./Merge.sh <file.lst> <output.mp4>"
echo "Ex:"
echo "file 'PICT0005_0016-0309_cut.mp4'"
echo "file 'PICT0005_0927-1000_cut.mp4'"
echo "file 'PICT0006_0043-0333_cut.mp4'"
echo "file 'PICT0006_0550-0800_cut.mp4'"
echo " "
ffmpeg -f concat -i $1 $2

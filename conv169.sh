#!/bin/sh
for FILE in *.AVI; do
	MAIN=`echo $FILE|cut -d '.' -f 1`
	echo ffmpeg -i $MAIN.AVI -aspect 16:9 -preset ultrafast -qp 0 -b:a 192k $MAIN.MP4
	ffmpeg -i $MAIN.AVI -aspect 16:9 -preset ultrafast -qp 0 -b:a 192k $MAIN.MP4
done

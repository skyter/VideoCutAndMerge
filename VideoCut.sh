#!/bin/bash

echo "Usage:"
echo "For example, a video file named 1.mp4, total length 10:00"
echo "You want 02:00 ~ 04:00, 06:00 ~ 07:13 to be cut from, then you "
echo "create a 1.txt file(same main file name), put the contents like these:"
echo "02:00<Tab>04:00"
echo "06:00<Tab>07:13"
echo "Then this script will cut the part you want and save to \"1 0200-0400.mp4\" and \"1 0600-0713.mp4\" for you"
echo " "
echo " "
echo "Starting to parse."
rm cmd.sh
rm cmdtr.sh
rm file.lst
for FILE in *.txt; do
	MAIN=`echo $FILE|cut -d '.' -f 1`
	VIDEO=`ls|grep $MAIN|grep -v txt|grep -v cut`
	echo $VIDEO"..."
	while read -r a b; do
		echo $a $b
		if [ $a"x" != "x" ] && [ $b"x" != "x" ]; then
			TA=`date --date="00:"$a "+%s"`
			TB=`date --date="00:"$b "+%s"`
			DUR=`expr $TB - $TA`
			DUR=`date --date=@$DUR "+%M:%S"`
			A=`echo $a|sed "s/://g"`
			B=`echo $b|sed "s/://g"`
			CUT="Cutting $MAIN\ $A\-$B\ cut.mp4 ..."
			echo $CUT" Duration: "$DUR
			echo "ffmpeg -i $VIDEO -ss 00\:$a -t 00\:$DUR -acodec copy -vcodec copy -async 1 \""$MAIN"_"$A"-"$B"_cut.mp4\"" >> cmd.sh
			echo "ffmpeg -i $VIDEO -ss 00\:$a -t 00\:$DUR -async 1 \""$MAIN"_"$A"-"$B"_cut.mp4\"" >> cmdtr.sh
			echo "file "$MAIN"_"$A"-"$B"_cut.mp4" >> file.lst
			#ffmpeg -i $VIDEO -ss 00\:$a -t 00\:$DUR -acodec copy -vcodec copy -async 1 "$MAIN $A-$B cut.mp4" >> cmd.sh
			#if [ $? -eq 1 ]; then
			#	echo "Can't cut copy, changing to transcode..."
			#	ffmpeg -loglevel panic -i $VIDEO -ss 00:$a -t 00:$DUR -async 1 "$MAIN $A-$B cut.mp4"
			#fi
		fi
	done < $FILE
	echo " "
done


# VideoCutAndMerge
a script used ffmepg for cutting video and then merge to single video file.
Usage:
For example, a video file named 1.mp4, total length 10:00
You want 02:00 ~ 04:00, 06:00 ~ 07:13 to be cut from, then you
create a 1.txt file(same main file name), put the contents like these:
02:00<Tab>04:00
06:00<Tab>07:13
Then this script will cut the part you want and save to "1 0200-0400.mp4" and "1 0600-0713.mp4" for you

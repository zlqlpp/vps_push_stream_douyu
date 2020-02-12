#!/bin/bash



#source ~/.bash_profile


while true
  do
        for element in `ls *.mp4 $1`
    do
        dir_or_file=$element

        echo $dir_or_file
	url=`cat rtmp_code`

	ffmpeg -re -i  "$dir_or_file" -vcodec copy -acodec aac -b:a 192k \
	-strict -2 -f flv "$url"


    done
  done




 #ps -ef|grep ffm |grep -v grep;ps -ef|grep 1_S |grep -v grep;ps -ef|grep 2_ |grep -v grep
 
 #ffmpeg -re   -i  d.mp4 -vcodec copy -acodec aac -b:a 192k -strict -2 -f flv "rtmp://send3a.douyu.com/live/1785739r9mT0ozEL?wsSecret=562cba28419ac24fb0d376fd5b04ceb8&wsTime=5e36acb7&wsSeek=off&wm=0&tw=0&roirecognition=0"
 
 

#alias p='ps -ef|grep ffm |grep -v grep;ps -ef|grep 1_S |grep -v grep;ps -ef|grep 2_ |grep -v grep|awk '{print $2}'




































#!/bin/bash

cd /usr/share/tomcat/webapps/vps_push_stream_douyu/video

#source ~/.bash_profile


while true
  do
        ##列出当前目录下所有的mp4文件
        for element in `ls *.* $1`
    do
        dir_or_file=$element

        echo $dir_or_file
        ###将推流的url放到当前目录下文件名是 1.txt的文件里
        url=`cat 1`

        ffmpeg -re -i  "$dir_or_file" -vcodec copy -acodec aac -b:a 192k \
        -strict -2 -f flv $url


    done
  done

#!/bin/bash

cd /root/douyu----------------------video3

showpid=`ps -ef|grep show.sh |grep -v grep|awk '{print $2}'`

ffmppid=`ps -ef|grep ffmpeg |grep -v grep|awk '{print $2}'`

kill -9 $showpid

kill -9 $ffmppid

nohup ./show.sh >> /dev/null 2>&1  &

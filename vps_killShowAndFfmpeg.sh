#!/bin/bash

cd /root/vps_push_stream_douyu

showpid=`ps -ef|grep show.sh |grep -v grep|awk '{print $2}'`

ffmppid=`ps -ef|grep ffmpeg |grep -v grep|awk '{print $2}'`

kill -9 $showpid

kill -9 $ffmppid

nohup ./vps_show.sh >> /dev/null 2>&1  &

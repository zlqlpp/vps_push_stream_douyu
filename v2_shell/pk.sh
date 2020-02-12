#!/bin/bash


  
 
 ffid=`ps -ef|grep ffm |grep -v grep|awk '{print $2}'`;
 shelid=`ps -ef|grep 2_ |grep -v grep|awk '{print $2}'`;
 kill -9 $shelid;
 kill -9 $ffid ;

 rm -rf *.rtmp
 
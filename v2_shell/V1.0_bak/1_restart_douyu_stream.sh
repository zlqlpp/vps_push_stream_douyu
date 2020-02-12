#!/bin/bash

cookie=`cat  cookie`

curl 'https://mp.douyu.com/live/pushflow/closeshow' \
-H 'authority: mp.douyu.com' \
-H 'accept: application/json, text/javascript, */*; q=0.01' \
-H 'origin: https://mp.douyu.com' \
-H 'x-requested-with: XMLHttpRequest' \
-H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36' \
-H 'dnt: 1' \
-H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \
-H 'sec-fetch-site: same-origin' \
-H 'sec-fetch-mode: cors' \
-H 'referer: https://mp.douyu.com/live/main' \
-H 'accept-encoding: gzip, deflate, br' \
-H 'accept-language: zh-CN,zh;q=0.9,en;q=0.8,zh-TW;q=0.7' \
-H "$cookie" \
--data 'cnn=55308405572615cb229f98c9bfb2a571' --compressed 

sleep 3

curl 'https://mp.douyu.com/live/pushflow/openShow' \
-H 'authority: mp.douyu.com' \
-H 'accept: application/json, text/javascript, */*; q=0.01' \
-H 'origin: https://mp.douyu.com' \
-H 'x-requested-with: XMLHttpRequest' \
-H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36' \
-H 'dnt: 1' \
-H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \
-H 'sec-fetch-site: same-origin' \
-H 'sec-fetch-mode: cors' \
-H 'referer: https://mp.douyu.com/live/main' \
-H 'accept-encoding: gzip, deflate, br' \
-H 'accept-language: zh-CN,zh;q=0.9,en;q=0.8,zh-TW;q=0.7' \
-H "$cookie" \
--data 'cnn=55308405572615cb229f98c9bfb2a571' --compressed   

 
sleep 3





#curl 'https://mp.douyu.com/live/pushflow/getRtmp' \
#    -H 'cookie: dy_did=68426b57982db2082da48edd00031501; smidV2=20181127175719ccd289f42e3ac80ecea397fd0ad1538300abb16c693520cb0; _ga=GA1.2.1294018937.1543316381; apollo_did=68426b57982db2082da48edd00031501; apollo_ctn=2697131cc0ba288a2ecd6184d32e0918; Hm_lvt_e99aee90ec1b2106afe7ec3b199020a7=1561541372; Hm_lpvt_e99aee90ec1b2106afe7ec3b199020a7=1561541372; apollo_uid=21873861; apollo_apollo_auth=ee34INRDCwjKpmFc0LN%2Fyd59hRQgqOMmnTllUwoQ4%2Fv%2B1LJO2ldputV7lU3dZqTXFKDKW6AqA2f6dbCzouITDTKFmTLXAWUq97D8f8w%2FjQ; PHPSESSID=5g8h1q5g92t4ktb6pvopa0gnk2; _dys_lastPageCode=page_anchor_creatcenter,page_anchor_creatcenter; _dys_refer_action_code=show_yzlive_banner' -H 'origin: https://mp.douyu.com' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: zh-CN,zh;q=0.9,en;q=0.8,zh-TW;q=0.7' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36' -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' -H 'accept: application/json, text/javascript, */*; q=0.01' -H 'referer: https://mp.douyu.com/live/main' -H 'authority: mp.douyu.com' -H 'x-requested-with: XMLHttpRequest' -H 'dnt: 1' --data 'cnn=2697131cc0ba288a2ecd6184d32e0918' --compressed \
#    > 3.rtmp.json
#
# 
#sleep 3
#
#
#cat 3.rtmp.json |jq -r .data.rtmp_url >4.rtmp
#echo "/">>4.rtmp
#
#cat 3.rtmp.json |jq -r .data.rtmp_val >>4.rtmp
#
#sed -e ':a;N;s/\n//;ta' 4.rtmp  >1.txt 






showpid=`ps -ef|grep 2_push_stream_to_douyu.sh |grep -v grep|awk '{print $2}'`

ffmppid=`ps -ef|grep ffmpeg |grep -v grep|awk '{print $2}'`

kill -9 $showpid

kill -9 $ffmppid

nohup ./2_push_stream_to_douyu.sh >> /dev/null 2>&1  &



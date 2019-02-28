#!/bin/sh
url=www.baidu.com
httpcode=`curl -o /dev/null -s -w %{http_code} "$url"`
#for code in $httpcode
#do
if [ $httpcode = 200 ]||[ $httpcode = 301 ]||[ $httpcode = 302 ]
then
    exit 0
else
    exit 1
fi
#done

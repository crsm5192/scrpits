#!/bin/sh
weblist=domain.list
for list in `cat $weblist|grep -E -v "#|^$"`
do
httpcode=`curl -o /dev/null -s -w %{http_code} "$list"`
httptime=`curl -o /dev/null -s -w "time_connect: %{time_connect}\ntime_starttransfer:%{time_starttransfer}\ntime_total: %{time_total}\n" "$list"|grep time_total|awk -F ":" '{print $2*1000}'`
#if [ $httpcode = 200 ]||[ $httpcode = 301 ]||[ $httpcode = 302 ]||[ $httpcode = 403 ]||[ $httpcode = 401 ]
if [ $httpcode = 200 ]||[ $httpcode = 301 ]||[ $httpcode = 302 ]
then
echo "$list is checked ok!"
else
echo "$list is down!" | mutt -s "web is down" dupeng@.com
fi
if [ $httptime -ge 10000 ]
then
echo "$list is timeout!" | mutt -s "web is timeout" dupeng@.com
else
echo "$list is connect ok!"
fi
done
#!/bin/sh
apppath=/data/8052_CBSGTomcat
appname=CimBetSportGame
for ip in {"172.17.0.13","172.17.0.101"}
do
time1=`ssh $ip "ps -ef | grep $apppath/bin | grep -v grep" | awk '{print $5}'`
time2=`ssh $ip "stat $apppath/webapps/$appname/" | grep -i Modify |awk '{print $3}'`
echo -e "$appname on $ip is \033[34m running \033[0m when \033[31m $time1 \033[0m"
echo -e "$appname on $ip is \033[34m modify \033[0m when \033[31m $time2 \033[0m"
done


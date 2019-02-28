#!/bin/sh
date=$(date +%Y-%m-%d-%H:%M:%S)
export JAVA_HOME=/usr/java/jdk1.7.0_80
#get url and appdir
appdir=8082_CBMTomcat
jspurl=8082/CimBetManager
#get service status
jspstat=`curl -s http://127.0.0.1:$jspurl/test.jsp`
javastat=`ps -ef | grep $appdir/bin | grep -v grep |wc -l`
#check service status
if [[ "$jspstat" -eq "1" ]] && [[ "javastat" -eq "1" ]];then
echo "$date the $jspurl is ok!" >> /data/shell/log/tomcat_check.log
else
sleep 5
ps -ef | grep $appdir/bin | grep -v grep  | awk {'print $2'} | xargs kill -9 1>/dev/null 2>/dev/null
sh /data/$appdir/bin/startup.sh
echo "$date the $jspurl is restart!" >> /data/shell/log/tomcat_check.log
fi
exit

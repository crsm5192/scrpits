#!/bin/sh
source /etc/profile
#stat=`ps -ef | grep zookeeper-3.4.8 | grep -v grep |wc -l`
stat=`/usr/local/zookeeper-3.4.8/bin/zkServer.sh status | awk {'print $2'}`
if [[ "$stat" = "contacting" ]];then 
ps -ef | grep zookeeper-3.4.8 | grep -v grep  | awk {'print $2'} | xargs kill -9 1>/dev/null 2>/dev/null
sh /usr/local/zookeeper-3.4.8/bin/zkServer.sh start
#echo "zookeeper is ok!"
else
echo "zookeeper is ok!"
#ps -ef | grep zookeeper-3.4.8 | grep -v grep  | awk {'print $2'} | xargs kill -9 1>/dev/null 2>/dev/null
#sh /usr/local/zookeeper-3.4.8/bin/zkServer.sh start
fi

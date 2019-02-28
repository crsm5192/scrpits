#!/bin/sh
dirdate=$(date +%Y_%m_%d)
logdate=$(date +%Y-%m-%d)
#CimBetAccount,CimBetBusiness,CimBetProtocol on 172.17.0.101/102/103
for ip in {"172.17.0.101","172.17.0.102","172.17.0.103"}
do
for appname in {"CimBetAccount","CimBetBusiness","CimBetProtocol"}
do
if [ "$appname" = "CimBetAccount" ] ; then
appdir="8012_CBATomcat"
elif [ "$appname" = "CimBetBusiness" ] ; then
appdir="8022_CBBTomcat"
elif [ "$appname" = "CimBetProtocol" ] ; then
appdir="8032_CBPTomcat"
fi
scp -r $ip:/data/$appdir/logs/$appname.log."$logdate"-* /data/log/$ip/$appname/$dirdate/
ssh $ip "find /data/$appdir/logs/ -type f -mtime +1 | xargs rm -rf"
done
done
#CimBetPay,CimBetSportGame,CimBetTimingTask,CimBetNoticeProtocol,CimBetManager on 172.17.0.11/13
for ip in {"172.17.0.11","172.17.0.100"}
do
for appname in {"CimBetPay","CimBetSportGame","CimBetTimingTask","CimBetNotifyProtocol","CimBetManager"}
do
if   [ "$appname" = "CimBetPay" ] ; then
appdir="8042_CBPTomcat"
elif [ "$appname" = "CimBetSportGame" ] ; then
appdir="8052_CBSGTomcat"
elif [ "$appname" = "CimBetTimingTask" ] ; then
appdir="8062_CBTTTomcat"
elif [ "$appname" = "CimBetNotifyProtocol" ] ; then
appdir="8072_CBNPTomcat"
elif [ "$appname" = "CimBetManager" ] ; then
appdir="8082_CBMTomcat"
fi
scp -r $ip:/data/$appdir/logs/$appname.log."$logdate"-* /data/log/$ip/$appname/$dirdate/
ssh $ip "find /data/$appdir/logs/ -type f -mtime +1 | xargs rm -rf"
done
done
exit

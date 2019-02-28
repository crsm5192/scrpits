!#/bin/sh
dirdate=$(date +%Y%m%d)
for appdir in {"8012_CBATomcat","8022_CBBTomcat","8032_CBPTomcat","8042_CBPTomcat","8052_CBSGTomcat","8062_CBTTTomcat","8072_CBNPTomcat","8082_CBMTomcat"}
do
if [ "$appdir" = "8012_CBATomcat" ] ; then
appname="CimBetAccount"
elif [ "$appdir" = "8022_CBBTomcat" ] ; then
appname="CimBetBusiness"
elif [ "$appdir" = "8032_CBPTomcat" ] ; then
appname="CimBetProtocol"
elif [ "$appdir" = "8042_CBPTomcat" ] ; then
appname="CimBetPay"
elif [ "$appdir" = "8052_CBSGTomcat" ] ; then
appname="CimBetSportGame"
elif [ "$appdir" = "8062_CBTTTomcat" ] ; then
appname="CimBetTimingTask"
elif [ "$appdir" = "8072_CBNPTomcat" ] ; then
appname="CimBetNotifyProtocol"
elif [ "$appdir" = "8082_CBMTomcat" ] ; then
appname="CimBetManager"
fi
#172.17.0.11
scp -r 172.17.0.11:/data/$appdir/logs/catalina.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
scp -r 172.17.0.11:/data/$appdir/logs/localhost.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
scp -r 172.17.0.11:/data/$appdir/logs/manager.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
scp -r 172.17.0.11:/data/$appdir/logs/localhost_access_log.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
scp -r 172.17.0.11:/data/$appdir/logs/host-manager.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
#sleep 5
ssh 172.17.0.11 "rm -rf /data/$appdir/logs/catalina.2*"
ssh 172.17.0.11 "rm -rf /data/$appdir/logs/localhost.2*"
ssh 172.17.0.11 "rm -rf /data/$appdir/logs/manager.2*"
ssh 172.17.0.11 "rm -rf /data/$appdir/logs/localhost_access_log.2*"
ssh 172.17.0.11 "rm -rf /data/$appdir/logs/host-manager.2*"
#172.17.0.12
scp -r 172.17.0.12:/data/$appdir/logs/catalina.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
scp -r 172.17.0.12:/data/$appdir/logs/localhost.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
scp -r 172.17.0.12:/data/$appdir/logs/manager.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
scp -r 172.17.0.12:/data/$appdir/logs/localhost_access_log.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
scp -r 172.17.0.12:/data/$appdir/logs/host-manager.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
#sleep 5
ssh 172.17.0.12 "rm -rf /data/$appdir/logs/catalina.2*"
ssh 172.17.0.12 "rm -rf /data/$appdir/logs/localhost.2*"
ssh 172.17.0.12 "rm -rf /data/$appdir/logs/manager.2*"
ssh 172.17.0.12 "rm -rf /data/$appdir/logs/localhost_access_log.2*"
ssh 172.17.0.12 "rm -rf /data/$appdir/logs/host-manager.2*"
#172.17.0.13
scp -r 172.17.0.13:/data/$appdir/logs/catalina.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
scp -r 172.17.0.13:/data/$appdir/logs/localhost.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
scp -r 172.17.0.13:/data/$appdir/logs/manager.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
scp -r 172.17.0.13:/data/$appdir/logs/localhost_access_log.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
scp -r 172.17.0.13:/data/$appdir/logs/host-manager.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
#sleep 5
ssh 172.17.0.13 "rm -rf /data/$appdir/logs/catalina.2*"
ssh 172.17.0.13 "rm -rf /data/$appdir/logs/localhost.2*"
ssh 172.17.0.13 "rm -rf /data/$appdir/logs/manager.2*"
ssh 172.17.0.13 "rm -rf /data/$appdir/logs/localhost_access_log.2*"
ssh 172.17.0.13 "rm -rf /data/$appdir/logs/host-manager.2*"
#172.17.0.101
scp -r 172.17.0.101:/data/$appdir/logs/catalina.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
scp -r 172.17.0.101:/data/$appdir/logs/localhost.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
scp -r 172.17.0.101:/data/$appdir/logs/manager.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
scp -r 172.17.0.101:/data/$appdir/logs/localhost_access_log.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
scp -r 172.17.0.101:/data/$appdir/logs/host-manager.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
#sleep 5
ssh 172.17.0.101 "rm -rf /data/$appdir/logs/catalina.2*"
ssh 172.17.0.101 "rm -rf /data/$appdir/logs/localhost.2*"
ssh 172.17.0.101 "rm -rf /data/$appdir/logs/manager.2*"
ssh 172.17.0.101 "rm -rf /data/$appdir/logs/localhost_access_log.2*"
ssh 172.17.0.101 "rm -rf /data/$appdir/logs/host-manager.2*"
#172.17.0.101
scp -r 172.17.0.102:/data/$appdir/logs/catalina.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
scp -r 172.17.0.102:/data/$appdir/logs/localhost.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
scp -r 172.17.0.102:/data/$appdir/logs/manager.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
scp -r 172.17.0.102:/data/$appdir/logs/localhost_access_log.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
scp -r 172.17.0.102:/data/$appdir/logs/host-manager.2* /data/log/tomcatlog/172.17.0.11/$appname/$dirdate
#sleep 5
ssh 172.17.0.102 "rm -rf /data/$appdir/logs/catalina.2*"
ssh 172.17.0.102 "rm -rf /data/$appdir/logs/localhost.2*"
ssh 172.17.0.102 "rm -rf /data/$appdir/logs/manager.2*"
ssh 172.17.0.102 "rm -rf /data/$appdir/logs/localhost_access_log.2*"
ssh 172.17.0.102 "rm -rf /data/$appdir/logs/host-manager.2*"
done
exit

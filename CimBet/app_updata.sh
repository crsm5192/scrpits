#!/bin/sh
time=$(date +"%Y-%m-%d--%H:%M:%S")
#ftp_setings
ftpaddr=
ftpuser=ftpuser
ftppwd=BgvvyZrHAD
ftppath=apps
#chose app for updata
echo -e "Input port to update app:\n 
\033[31m 8012 \033[0m for CimBetAccount.
\033[31m 8022 \033[0m for CimBetBusiness.
\033[31m 8032 \033[0m for CimBetProtocol.
\033[31m 8042 \033[0m for CimBetPay.
\033[31m 8052 \033[0m for CimBetSportGame.
\033[31m 8062 \033[0m for CimBetTimingTask.
\033[31m 8072 \033[0m for CimBetNotifyProtocol.
\033[31m 8082 \033[0m for CimBetManager.
"
read port
case "$port" in
#8012 CimBetAccount
8012)
apppath=/data/8012_CBATomcat
appname=CimBetAccount
rm -rf /data/app/$appname.war
ftp -niv << EOF
open $ftpaddr
user $ftpuser $ftppwd
binary
lcd /data/app
cd $ftppath
get $appname.war
bye
EOF
for serverip in {"172.17.0.101","172.17.0.102","172.17.0.103"}
do
ssh  $serverip "service crond stop"
ssh  $serverip "ps -ef | grep $apppath/bin | grep -v grep  | awk {'print $2'} | xargs kill -9 1>/dev/null 2>/dev/null"
ssh  $serverip "rm -rf $apppath/work/*"
ssh  $serverip "rm -rf $apppath/webapps/$appname/*"
scp -r /data/app/$appname.war $serverip:$apppath/webapps/$appname/
ssh  $serverip "cd $apppath/webapps/$appname/ && jar xvf $appname.war"
ssh  $serverip "source /etc/profile && $apppath/bin/startup.sh"
sleep 15
ssh  $serverip "service crond start"
echo -e "\033[31m $appname \033[0m  update on \033[31m $serverip \033[0m  is ok"
ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
done
#updata_check
for ip in {"172.17.0.101","172.17.0.102","172.17.0.103"}
do
time1=`ssh $ip "ps -ef | grep $apppath/bin | grep -v grep" | awk '{print $5}'`
time2=`ssh $ip "stat $apppath/webapps/$appname/META-INF" | grep -i Modify |awk '{print $3}'`
echo -e "$appname on $ip is \033[34m running \033[0m when \033[31m $time1 \033[0m"
echo -e "$appname on $ip is \033[34m modify \033[0m when \033[31m $time2 \033[0m"
done
exit
;;
#8022 CimBetBusiness
8022)
apppath=/data/8022_CBBTomcat
appname=CimBetBusiness
rm -rf /data/app/$appname.war
ftp -niv << EOF
open $ftpaddr
user $ftpuser $ftppwd
binary
lcd /data/app
cd $ftppath
get $appname.war
bye
EOF
for serverip in {"172.17.0.101","172.17.0.102","172.17.0.103"}
do
ssh  $serverip "service crond stop"
ssh  $serverip "ps -ef | grep $apppath/bin | grep -v grep  | awk {'print $2'} | xargs kill -9 1>/dev/null 2>/dev/null"
ssh  $serverip "rm -rf $apppath/work/*"
ssh  $serverip "rm -rf $apppath/webapps/$appname/*"
scp -r /data/app/$appname.war $serverip:$apppath/webapps/$appname/
ssh  $serverip "cd $apppath/webapps/$appname/ && jar xvf $appname.war"
ssh  $serverip "source /etc/profile && $apppath/bin/startup.sh"
sleep 15
ssh  $serverip "service crond start"
echo -e "\033[31m $appname \033[0m  update on \033[31m $serverip \033[0m  is ok"
ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
done
#updata_check
for ip in {"172.17.0.101","172.17.0.102","172.17.0.103"}
do
time1=`ssh $ip "ps -ef | grep $apppath/bin | grep -v grep" | awk '{print $5}'`
time2=`ssh $ip "stat $apppath/webapps/$appname/META-INF" | grep -i Modify |awk '{print $3}'`
echo -e "$appname on $ip is \033[34m running \033[0m when \033[31m $time1 \033[0m"
echo -e "$appname on $ip is \033[34m modify \033[0m when \033[31m $time2 \033[0m"
done
exit
;;

8032)
apppath=/data/8032_CBPTomcat
appname=CimBetProtocol
rm -rf /data/app/$appname.war
ftp -niv << EOF
open $ftpaddr
user $ftpuser $ftppwd
binary
lcd /data/app
cd $ftppath
get $appname.war
bye
EOF
for serverip in {"172.17.0.101","172.17.0.102","172.17.0.103"}
do
ssh  $serverip "service crond stop"
ssh  $serverip "ps -ef | grep $apppath/bin | grep -v grep  | awk {'print $2'} | xargs kill -9 1>/dev/null 2>/dev/null"
ssh  $serverip "rm -rf $apppath/work/*"
ssh  $serverip "rm -rf $apppath/webapps/$appname/*"
scp -r /data/app/$appname.war $serverip:$apppath/webapps/$appname/
ssh  $serverip "cd $apppath/webapps/$appname/ && jar xvf $appname.war"
ssh  $serverip "source /etc/profile && $apppath/bin/startup.sh"
sleep 15
ssh  $serverip "service crond start"
echo -e "\033[31m $appname \033[0m  update on \033[31m $serverip \033[0m  is ok"
ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
done
#updata_check
for ip in {"172.17.0.101","172.17.0.102","172.17.0.103"}
do
time1=`ssh $ip "ps -ef | grep $apppath/bin | grep -v grep" | awk '{print $5}'`
time2=`ssh $ip "stat $apppath/webapps/$appname/META-INF" | grep -i Modify |awk '{print $3}'`
echo -e "$appname on $ip is \033[34m running \033[0m when \033[31m $time1 \033[0m"
echo -e "$appname on $ip is \033[34m modify \033[0m when \033[31m $time2 \033[0m"
done
exit
;;

8042)
apppath=/data/8042_CBPTomcat
appname=CimBetPay
rm -rf /data/app/$appname.war
ftp -niv << EOF
open $ftpaddr
user $ftpuser $ftppwd
binary
lcd /data/app
cd $ftppath
get $appname.war
bye
EOF
for serverip in {"172.17.0.11","172.17.0.100"}
do
ssh  $serverip "service crond stop"
ssh  $serverip "ps -ef | grep $apppath/bin | grep -v grep  | awk {'print $2'} | xargs kill -9 1>/dev/null 2>/dev/null"
ssh  $serverip "rm -rf $apppath/work/*"
ssh  $serverip "rm -rf $apppath/webapps/$appname/*"
scp -r /data/app/$appname.war $serverip:$apppath/webapps/$appname/
ssh  $serverip "cd $apppath/webapps/$appname/ && jar xvf $appname.war"
echo -e "\033[31m $appname \033[0m  update on \033[31m $serverip \033[0m  is ok"
ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
done
ssh  172.17.0.100 "source /etc/profile && $apppath/bin/startup.sh"
sleep 15
ssh  172.17.0.11 "service crond start"
ssh  172.17.0.100 "service crond start"
#upadta_check
for ip in {"172.17.0.11","172.17.0.100"}
do
time1=`ssh $ip "ps -ef | grep $apppath/bin | grep -v grep" | awk '{print $5}'`
time2=`ssh $ip "stat $apppath/webapps/$appname/META-INF" | grep -i Modify |awk '{print $3}'`
echo -e "$appname on $ip is \033[34m running \033[0m when \033[31m $time1 \033[0m"
echo -e "$appname on $ip is \033[34m modify \033[0m when \033[31m $time2 \033[0m"
done
exit
;;

8052)
apppath=/data/8052_CBSGTomcat
appname=CimBetSportGame
rm -rf /data/app/$appname.war
ftp -niv << EOF
open $ftpaddr
user $ftpuser $ftppwd
binary
lcd /data/app
cd $ftppath
get $appname.war
bye
EOF
for serverip in {"172.17.0.11","172.17.0.100"}
do
ssh  $serverip "service crond stop"
ssh  $serverip "ps -ef | grep $apppath/bin | grep -v grep  | awk {'print $2'} | xargs kill -9 1>/dev/null 2>/dev/null"
ssh  $serverip "rm -rf $apppath/work/*"
ssh  $serverip "rm -rf $apppath/webapps/$appname/*"
scp -r /data/app/$appname.war $serverip:$apppath/webapps/$appname/
ssh  $serverip "cd $apppath/webapps/$appname/ && jar xvf $appname.war"
echo -e "\033[31m $appname \033[0m  update on \033[31m $serverip \033[0m  is ok"
ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
done
ssh  172.17.0.100 "source /etc/profile && $apppath/bin/startup.sh"
sleep 15
ssh  172.17.0.11 "service crond start"
ssh  172.17.0.100 "service crond start"
#upadta_check
for ip in {"172.17.0.11","172.17.0.100"}
do
time1=`ssh $ip "ps -ef | grep $apppath/bin | grep -v grep" | awk '{print $5}'`
time2=`ssh $ip "stat $apppath/webapps/$appname/META-INF" | grep -i Modify |awk '{print $3}'`
echo -e "$appname on $ip is \033[34m running \033[0m when \033[31m $time1 \033[0m"
echo -e "$appname on $ip is \033[34m modify \033[0m when \033[31m $time2 \033[0m"
done
exit
;;

8062)
apppath=/data/8062_CBTTTomcat
appname=CimBetTimingTask
rm -rf /data/app/$appname.war
ftp -niv << EOF
open $ftpaddr
user $ftpuser $ftppwd
binary
lcd /data/app
cd $ftppath
get $appname.war
bye
EOF
for serverip in {"172.17.0.11","172.17.0.100"}
do
ssh  $serverip "service crond stop"
ssh  $serverip "ps -ef | grep $apppath/bin | grep -v grep  | awk {'print $2'} | xargs kill -9 1>/dev/null 2>/dev/null"
ssh  $serverip "rm -rf $apppath/work/*"
ssh  $serverip "rm -rf $apppath/webapps/$appname/*"
scp -r /data/app/$appname.war $serverip:$apppath/webapps/$appname/
ssh  $serverip "cd $apppath/webapps/$appname/ && jar xvf $appname.war"
echo -e "\033[31m $appname \033[0m  update on \033[31m $serverip \033[0m  is ok"
ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
done
ssh  172.17.0.100 "source /etc/profile && $apppath/bin/startup.sh"
sleep 15
ssh  172.17.0.11 "service crond start"
ssh  172.17.0.100 "service crond start"
#upadta_check
for ip in {"172.17.0.11","172.17.0.100"}
do
time1=`ssh $ip "ps -ef | grep $apppath/bin | grep -v grep" | awk '{print $5}'`
time2=`ssh $ip "stat $apppath/webapps/$appname/META-INF" | grep -i Modify |awk '{print $3}'`
echo -e "$appname on $ip is \033[34m running \033[0m when \033[31m $time1 \033[0m"
echo -e "$appname on $ip is \033[34m modify \033[0m when \033[31m $time2 \033[0m"
done
exit
;;

8072)
apppath=/data/8072_CBNPTomcat
appname=CimBetNotifyProtocol
rm -rf /data/app/$appname.war
ftp -niv << EOF
open $ftpaddr
user $ftpuser $ftppwd
binary
lcd /data/app
cd $ftppath
get $appname.war
bye
EOF
for serverip in {"172.17.0.11","172.17.0.100"}
do
ssh  $serverip "service crond stop"
ssh  $serverip "ps -ef | grep $apppath/bin | grep -v grep  | awk {'print $2'} | xargs kill -9 1>/dev/null 2>/dev/null"
ssh  $serverip "rm -rf $apppath/work/*"
ssh  $serverip "rm -rf $apppath/webapps/$appname/*"
scp -r /data/app/$appname.war $serverip:$apppath/webapps/$appname/
ssh  $serverip "cd $apppath/webapps/$appname/ && jar xvf $appname.war"
echo -e "\033[31m $appname \033[0m  update on \033[31m $serverip \033[0m  is ok"
ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
done
ssh  172.17.0.100 "source /etc/profile && $apppath/bin/startup.sh"
sleep 15
ssh  172.17.0.11 "service crond start"
ssh  172.17.0.100 "service crond start"
#upadta_check
for ip in {"172.17.0.11","172.17.0.100"}
do
time1=`ssh $ip "ps -ef | grep $apppath/bin | grep -v grep" | awk '{print $5}'`
time2=`ssh $ip "stat $apppath/webapps/$appname/META-INF" | grep -i Modify |awk '{print $3}'`
echo -e "$appname on $ip is \033[34m running \033[0m when \033[31m $time1 \033[0m"
echo -e "$appname on $ip is \033[34m modify \033[0m when \033[31m $time2 \033[0m"
done
exit
;;

8082)
apppath=/data/8082_CBMTomcat
appname=CimBetManager
rm -rf /data/app/$appname.war
ftp -niv << EOF
open $ftpaddr
user $ftpuser $ftppwd
binary
lcd /data/app
cd $ftppath
get $appname.war
bye
EOF
for serverip in {"172.17.0.11","172.17.0.100"}
do
ssh  $serverip "service crond stop"
ssh  $serverip "ps -ef | grep $apppath/bin | grep -v grep  | awk {'print $2'} | xargs kill -9 1>/dev/null 2>/dev/null"
ssh  $serverip "rm -rf $apppath/work/*"
ssh  $serverip "rm -rf $apppath/webapps/$appname/*"
scp -r /data/app/$appname.war $serverip:$apppath/webapps/$appname/
ssh  $serverip "cd $apppath/webapps/$appname/ && jar xvf $appname.war"
echo -e "\033[31m $appname \033[0m  update on \033[31m $serverip \033[0m  is ok"
ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
done
ssh  172.17.0.100 "source /etc/profile && $apppath/bin/startup.sh"
sleep 15
ssh  172.17.0.11 "service crond start"
ssh  172.17.0.100 "service crond start"
#upadta_check
for ip in {"172.17.0.11","172.17.0.100"}
do
time1=`ssh $ip "ps -ef | grep $apppath/bin | grep -v grep" | awk '{print $5}'`
time2=`ssh $ip "stat $apppath/webapps/$appname/META-INF" | grep -i Modify |awk '{print $3}'`
echo -e "$appname on $ip is \033[34m running \033[0m when \033[31m $time1 \033[0m"
echo -e "$appname on $ip is \033[34m modify \033[0m when \033[31m $time2 \033[0m"
done
exit
;;

*)
echo -e "ERROR
NOW EXIT"
sleep 2
exit
;;
esac






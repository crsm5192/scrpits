#!/bin/sh
time=$(date +"%Y-%m-%d--%H:%M:%S")
#ftpfiles
ftpaddr=
ftpuser=ftpuser
ftppwd=BgvvyZrHAD
ftppath=apps

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

8012)
apppath=/data/8012_CBATomcat
appname=CimBetAccount
echo -e "\033[31m $appname \033[0m is begin to update. "
sleep 2
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
echo "$appname update_files has got"
for serverip in {"172.17.0.11","172.17.0.12","172.17.0.13","172.17.0.101","172.17.0.102"}
do
ssh  $serverip "service crond stop"
ssh  $serverip "ps -ef | grep $apppath/bin | grep -v grep  | awk {'print $2'} | xargs kill -9 1>/dev/null 2>/dev/null"
#ssh  $serverip "sh $apppath/kill.sh"
ssh  $serverip "rm -rf $apppath/work/*"
#ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
ssh  $serverip "rm -rf $apppath/webapps/$appname/*"
scp -r /data/app/$appname.war $serverip:$apppath/webapps/$appname/
ssh  $serverip "cd $apppath/webapps/$appname/ && jar xvf $appname.war"
#ssh  $serverip "rm -rf /root/.dubbo/*"
ssh  $serverip "source /etc/profile && $apppath/bin/startup.sh"
ssh  $serverip "service crond start"
echo -e "\033[31m $appname \033[0m  update on \033[31m $serverip \033[0m  is ok"
ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
sleep 10
done
exit
;;

8022)
apppath=/data/8022_CBBTomcat
appname=CimBetBusiness
echo -e "\033[31m $appname \033[0m is begin to update. "
sleep 2
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
echo "$appname update_files has got"
for serverip in {"172.17.0.11","172.17.0.12","172.17.0.13","172.17.0.101","172.17.0.102"}
do
ssh  $serverip "service crond stop"
ssh  $serverip "ps -ef | grep $apppath/bin | grep -v grep  | awk {'print $2'} | xargs kill -9 1>/dev/null 2>/dev/null"
#ssh  $serverip "sh $apppath/kill.sh"
ssh  $serverip "rm -rf $apppath/work/*"
#ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
ssh  $serverip "rm -rf $apppath/webapps/$appname/*"
scp -r /data/app/$appname.war $serverip:$apppath/webapps/$appname/
ssh  $serverip "cd $apppath/webapps/$appname/ && jar xvf $appname.war"
#ssh  $serverip "rm -rf /root/.dubbo/*"
ssh  $serverip "source /etc/profile && $apppath/bin/startup.sh"
ssh  $serverip "service crond start"
echo -e "\033[31m $appname \033[0m  update on \033[31m $serverip \033[0m  is ok"
ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
sleep 10
done
exit
;;

8032)
apppath=/data/8032_CBPTomcat
appname=CimBetProtocol
echo -e "\033[31m $appname \033[0m is begin to update. "
sleep 2
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
echo "$appname update_files has got"
for serverip in {"172.17.0.11","172.17.0.12","172.17.0.13","172.17.0.101","172.17.0.102"}
do
ssh  $serverip "service crond stop"
ssh  $serverip "ps -ef | grep $apppath/bin | grep -v grep  | awk {'print $2'} | xargs kill -9 1>/dev/null 2>/dev/null"
#ssh  $serverip "sh $apppath/kill.sh"
ssh  $serverip "rm -rf $apppath/work/*"
#ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
ssh  $serverip "rm -rf $apppath/webapps/$appname/*"
scp -r /data/app/$appname.war $serverip:$apppath/webapps/$appname/
ssh  $serverip "cd $apppath/webapps/$appname/ && jar xvf $appname.war"
#ssh  $serverip "rm -rf /root/.dubbo/*"
ssh  $serverip "source /etc/profile && $apppath/bin/startup.sh"
ssh  $serverip "service crond start"
echo -e "\033[31m $appname \033[0m  update on \033[31m $serverip \033[0m  is ok"
ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
sleep 10
done
exit
;;

8042)
apppath=/data/8042_CBPTomcat
appname=CimBetPay
echo -e "\033[31m $appname \033[0m is begin to update. "
sleep 2
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
echo "$appname update_files has got"
for serverip in {"172.17.0.11","172.17.0.13"}
do
ssh  $serverip "service crond stop"
ssh  $serverip "ps -ef | grep $apppath/bin | grep -v grep  | awk {'print $2'} | xargs kill -9 1>/dev/null 2>/dev/null"
#ssh  $serverip "sh $apppath/kill.sh"
ssh  $serverip "rm -rf $apppath/work/*"
#ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
ssh  $serverip "rm -rf $apppath/webapps/$appname/*"
scp -r /data/app/$appname.war $serverip:$apppath/webapps/$appname/
ssh  $serverip "cd $apppath/webapps/$appname/ && jar xvf $appname.war"
#ssh  $serverip "source /etc/profile && $apppath/bin/startup.sh"
ssh  $serverip "service crond start"
echo -e "\033[31m $appname \033[0m  update on \033[31m $serverip \033[0m  is ok"
ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
#ssh  $serverip "rm -rf /root/.dubbo/*"
sleep 10
done
ssh  172.17.0.11 "source /etc/profile && $apppath/bin/startup.sh"
exit
;;

8052)
apppath=/data/8052_CBSGTomcat
appname=CimBetSportGame
echo -e "\033[31m $appname \033[0m is begin to update. "
sleep 2
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
echo "$appname update_files has got"
for serverip in {"172.17.0.13","172.17.0.101"}
do
ssh  $serverip "service crond stop"
ssh  $serverip "ps -ef | grep $apppath/bin | grep -v grep  | awk {'print $2'} | xargs kill -9 1>/dev/null 2>/dev/null"
#ssh  $serverip "sh $apppath/kill.sh"
ssh  $serverip "rm -rf $apppath/work/*"
#ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
ssh  $serverip "rm -rf $apppath/webapps/$appname/*"
scp -r /data/app/$appname.war $serverip:$apppath/webapps/$appname/
ssh  $serverip "cd $apppath/webapps/$appname/ && jar xvf $appname.war"
ssh  $serverip "service crond start"
echo -e "\033[31m $appname \033[0m  update on \033[31m $serverip \033[0m  is ok"
ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
#ssh  $serverip "rm -rf /root/.dubbo/*"
sleep 10
done
ssh  172.17.0.101 "source /etc/profile && $apppath/bin/startup.sh"
exit
;;

8062)
apppath=/data/8062_CBTTTomcat
appname=CimBetTimingTask
echo -e "\033[31m $appname \033[0m is begin to update. "
sleep 2
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
echo "$appname update_files has got"
for serverip in {"172.17.0.13","172.17.0.102"}
do
ssh  $serverip "service crond stop"
ssh  $serverip "ps -ef | grep $apppath/bin | grep -v grep  | awk {'print $2'} | xargs kill -9 1>/dev/null 2>/dev/null"
#ssh  $serverip "sh $apppath/kill.sh"
ssh  $serverip "rm -rf $apppath/work/*"
#ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
ssh  $serverip "rm -rf $apppath/webapps/$appname/*"
scp -r /data/app/$appname.war $serverip:$apppath/webapps/$appname/
ssh  $serverip "cd $apppath/webapps/$appname/ && jar xvf $appname.war"
ssh  $serverip "service crond start"
echo -e "\033[31m $appname \033[0m  update on \033[31m $serverip \033[0m  is ok"
ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
#ssh  $serverip "rm -rf /root/.dubbo/*"
sleep 10
done
ssh  172.17.0.102 "source /etc/profile && $apppath/bin/startup.sh"
exit
;;

8072)
apppath=/data/8072_CBNPTomcat
appname=CimBetNotifyProtocol
echo -e "\033[31m $appname \033[0m is begin to update. "
sleep 2
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
echo "$appname update_files has got"
for serverip in {"172.17.0.12","172.17.0.13"}
do
ssh  $serverip "service crond stop"
ssh  $serverip "ps -ef | grep $apppath/bin | grep -v grep  | awk {'print $2'} | xargs kill -9 1>/dev/null 2>/dev/null"
#ssh  $serverip "sh $apppath/kill.sh"
ssh  $serverip "rm -rf $apppath/work/*"
#ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
ssh  $serverip "rm -rf $apppath/webapps/$appname/*"
scp -r /data/app/$appname.war $serverip:$apppath/webapps/$appname/
ssh  $serverip "cd $apppath/webapps/$appname/ && jar xvf $appname.war"
#ssh  $serverip "source /etc/profile && $apppath/bin/startup.sh"
ssh  $serverip "service crond start"
echo -e "\033[31m $appname \033[0m  update on \033[31m $serverip \033[0m  is ok"
ssh  $serverip "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
#ssh  $serverip "rm -rf /root/.dubbo/*"
sleep 10
done
ssh  172.17.0.12 "source /etc/profile && $apppath/bin/startup.sh"
exit
;;

8082)
apppath=/data/8082_CBMTomcat
appname=CimBetManager
serverport=14382
echo -e "\033[31m $appname \033[0m is begin to update. "
sleep 2
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
echo "$appname update_files has got"
serverip=172.17.0.11
ssh  $serverip -p $serverport "service crond stop"
ssh  $serverip -p $serverport "ps -ef | grep $apppath/bin | grep -v grep  | awk {'print $2'} | xargs kill -9 1>/dev/null 2>/dev/null"
#ssh  $serverip "sh $apppath/kill.sh"
ssh  $serverip -p $serverport "rm -rf $apppath/work/*"
#ssh  $serverip -p $serverport "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
ssh  $serverip -p $serverport "rm -rf $apppath/webapps/$appname/*"
scp -r -P $serverport /data/app/$appname.war $serverip:$apppath/webapps/$appname/
ssh  $serverip -p $serverport "cd $apppath/webapps/$appname/ && jar xvf $appname.war"
#ssh  $serverip "rm -rf /root/.dubbo/*"
ssh  $serverip -p $serverport "source /etc/profile && $apppath/bin/startup.sh"
ssh  $serverip -p $serverport "service crond start"
echo -e "\033[31m $appname \033[0m  update on \033[31m $serverip \033[0m  is ok"
ssh  $serverip -p $serverport "mv $apppath/webapps/$appname/$appname.war /data/app/bak/$appname-$time.war"
sleep 10
exit
;;

*)
echo -e "ERROR
NOW EXIT"
sleep 2
exit
;;
esac




#!/bin/sh
time=$(date +"%Y-%m-%d-%H:%M:%S")
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
apppath=/data/8012_CBATomcat/logs
appname=CimBetAccount
rm -rf /data/shell/log/temp/*
for serverip in {"172.17.0.11","172.17.0.12","172.17.0.13","172.17.0.101","172.17.0.102"}
do
scp $serverip:$apppath/$appname.log /data/shell/log/temp/
mv /data/shell/log/temp/$appname.log /data/shell/log/temp/$serverip+$appname.log
done
zip /data/shell/log/temp/$time+$appname.zip /data/shell/log/temp/*
rm -rf /data/shell/log/temp/172.17.0.*
exit
;;
8022)
apppath=/data/8022_CBBTomcat/logs
appname=CimBetBusiness
rm -rf /data/shell/log/temp/*
for serverip in {"172.17.0.11","172.17.0.12","172.17.0.13","172.17.0.101","172.17.0.102"}
do
scp $serverip:$apppath/$appname.log /data/shell/log/temp/
mv /data/shell/log/temp/$appname.log /data/shell/log/temp/$serverip+$appname.log
done
zip /data/shell/log/temp/$time+$appname.zip /data/shell/log/temp/*
rm -rf /data/shell/log/temp/172.17.0.*
exit
;;
8032)
apppath=/data/8032_CBPTomcat/logs
appname=CimBetProtocol
rm -rf /data/shell/log/temp/*
for serverip in {"172.17.0.11","172.17.0.12","172.17.0.13","172.17.0.101","172.17.0.102"}
do
scp $serverip:$apppath/$appname.log /data/shell/log/temp/
mv /data/shell/log/temp/$appname.log /data/shell/log/temp/$serverip+$appname.log
done
zip /data/shell/log/temp/$time+$appname.zip /data/shell/log/temp/*
rm -rf /data/shell/log/temp/172.17.0.*
exit
;;
8042)
apppath=/data/8042_CBPTomcat/logs
appname=CimBetPay
rm -rf /data/shell/log/temp/*
for serverip in {"172.17.0.11","172.17.0.13"}
do
scp $serverip:$apppath/$appname.log /data/shell/log/temp/
mv /data/shell/log/temp/$appname.log /data/shell/log/temp/$serverip+$appname.log
done
zip /data/shell/log/temp/$time+$appname.zip /data/shell/log/temp/*
rm -rf /data/shell/log/temp/172.17.0.*
exit
;;
8052)
apppath=/data/8052_CBSGTomcat/logs
appname=CimBetSportGame
rm -rf /data/shell/log/temp/*
for serverip in {"172.17.0.13","172.17.0.101"}
do
scp $serverip:$apppath/$appname.log /data/shell/log/temp/
mv /data/shell/log/temp/$appname.log /data/shell/log/temp/$serverip+$appname.log
done
zip /data/shell/log/temp/$time+$appname.zip /data/shell/log/temp/*
rm -rf /data/shell/log/temp/172.17.0.*
exit
;;
8062)
apppath=/data/8062_CBTTTomcat/logs
appname=CimBetTimingTask
rm -rf /data/shell/log/temp/*
for serverip in {"172.17.0.13","172.17.0.102"}
do
scp $serverip:$apppath/$appname.log /data/shell/log/temp/
mv /data/shell/log/temp/$appname.log /data/shell/log/temp/$serverip+$appname.log
done
zip /data/shell/log/temp/$time+$appname.zip /data/shell/log/temp/*
rm -rf /data/shell/log/temp/172.17.0.*
exit
;;
8072)
apppath=/data/8072_CBNPTomcat/logs
appname=CimBetNotifyProtocol
rm -rf /data/shell/log/temp/*
for serverip in {"172.17.0.13","172.17.0.12"}
do
scp $serverip:$apppath/$appname.log /data/shell/log/temp/
mv /data/shell/log/temp/$appname.log /data/shell/log/temp/$serverip+$appname.log
done
zip /data/shell/log/temp/$time+$appname.zip /data/shell/log/temp/*
rm -rf /data/shell/log/temp/172.17.0.*
exit
;;
8082)
apppath=/data/8082_CBMTomcat/logs
appname=CimBetManager
rm -rf /data/shell/log/temp/*
for serverip in {"172.17.0.13","172.17.0.11"}
do
scp $serverip:$apppath/$appname.log /data/shell/log/temp/
mv /data/shell/log/temp/$appname.log /data/shell/log/temp/$serverip+$appname.log
done
zip /data/shell/log/temp/$time+$appname.zip /data/shell/log/temp/*
rm -rf /data/shell/log/temp/172.17.0.*
exit
;;
*)
echo error
exit
;;
esac

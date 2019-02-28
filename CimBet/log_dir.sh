#!/bin/sh
dirdate=$(date +%Y_%m_%d)
#for appname in {"CimBetAccount","CimBetBusiness","CimBetProtocol","CimBetPay","CimBetSportGame","CimBetTimingTask","CimBetNotifyProtocol","CimBetManager"}
for appname in {"CimBetAccount","CimBetBusiness","CimBetProtocol"}
do
#CimBetAccount,CimBetBusiness,CimBetProtocol for 172.17.0.11/12/13/101/102
mkdir -p /data/log/172.17.0.101/$appname/$dirdate/
mkdir -p /data/log/172.17.0.102/$appname/$dirdate/
mkdir -p /data/log/172.17.0.103/$appname/$dirdate/
done
#CimBetPay,CimBetSportGame,CimBetTimingTask,CimBetNotifyProtocol,CimBetManager for 172.17.0.11/13
for appname in {"CimBetPay","CimBetSportGame","CimBetTimingTask","CimBetNotifyProtocol","CimBetManager"}
do
mkdir -p /data/log/172.17.0.11/$appname/$dirdate/
mkdir -p /data/log/172.17.0.100/$appname/$dirdate/
done
exit

#!/bin/sh
timing=`date +%Y-%m-%d-%H:%M:%S`
COUNT=20
MAX=10
ipadd=172.17.0.100
for appdir in {"8042_CBPTomcat","8052_CBSGTomcat","8062_CBTTTomcat","8072_CBNPTomcat"}
do
if   [ "$appdir" = "8042_CBPTomcat" ]  ; then
jspurl="8042/CimBetPay"
elif [ "$appdir" = "8052_CBSGTomcat" ] ; then
jspurl="8052/CimBetSportGame"
elif [ "$appdir" = "8062_CBTTTomcat" ] ; then
jspurl="8062/CimBetTimingTask"
elif [ "$appdir" = "8072_CBNPTomcat" ] ; then
jspurl="8072/CimBetNotifyProtocol"
fi
ping $ipadd -c $COUNT > /data/shell/log/ping.log
losspag=`grep "packet loss" /data/shell/log/ping.log |awk '{print $6}' |sed 's/%//g'`
jspstat=`curl -s http://$ipadd:$jspurl/test.jsp`
if [ $losspag -ge $MAX ] && [ "javastat" -ne "1" ] ; then
ssh 172.17.0.11 "ps -ef | grep $appdir/bin | grep -v grep  | awk {'print $2'} | xargs kill -9"
ssh 172.17.0.11 "source /etc/profile && sh /data/$appdir/bin/startup.sh"
#for mail in {"sxqem@163.com","406602041@qq.com","41657920@qq.com","715602382@qq.com"}
for mail in {"715602382@qq.com","1302129332@qq.com"}
do
echo "when $timing $ipadd is down,$jspurl is running on 172.17.0.11" |mail -s "$ipadd  is down" $mail
done
else
echo $timing $jspurl on $ipadd is ok >> /data/shell/log/single_check.log
fi
done
exit

#!/bin/sh
date=$(date +%Y-%m-%d-%H:%M:%S)
#CimBetAccount,CimBetBusiness,CimBetProtocol for 172.17.0.101/102/103/
for ipaddr in {"172.17.0.101","172.17.0.102","172.17.0.103"}
do
for appname in {"8012/CimBetAccount","8022/CimBetBusiness","8032/CimBetProtocol"}
do
stat=`curl -s $ipaddr:$appname/test.jsp`
if [ "$stat" = "1" ];then
echo "when $date $appname on $ipaddr  is ok" >> /data/shell/log/check-notice.log
else
echo "when $date $appname on $ipaddr  is down" >> /data/shell/log/check-notice.log
#for mail in {"@163.com","@qq.com","@qq.com","@qq.com"}
for mail in {"@qq.com","1302129332@qq.com"}
do
echo "when $date $appname on $ipaddr  is down" |mail -s "$appname on $ipaddr is down" $mail
done
fi
done
done

#CimBetPay for 172.17.0.100
stat41=`curl -s 172.17.0.100:8042/CimBetPay/test.jsp`
if [ "$stat41" = "1" ];then
echo "when $date 8042/CimBetPay on 172.17.0.100  is ok" >> /data/shell/log/check-notice.log
else
echo "when $date 8042/CimBetPay on 172.17.0.100  is down" >> /data/shell/log/check-notice.log
#for mail in {"@163.com","@qq.com","@qq.com","@qq.com"}
for mail in {"@qq.com","1302129332@qq.com"}
do
echo "when $date 8042/CimBetPay on 172.17.0.100  is down" |mail -s "8042/CimBetPay on 172.17.0.100 is down" $mail
done
fi
#CimBetSportGame for 172.17.0.100
stat51=`curl -s 172.17.0.100:8052/CimBetSportGame/test.jsp`
if [ "$stat51" = "1" ];then
echo "when $date 8052/CimBetSportGame on 172.17.0.100  is ok" >> /data/shell/log/check-notice.log
else
echo "when $date 8052/CimBetSportGame on 172.17.0.100  is down" >> /data/shell/log/check-notice.log
for mail in {"@163.com","@qq.com","@qq.com","@qq.com"}
#for mail in {"@qq.com","1302129332@qq.com"}
do
echo "when $date 8052/CimBetSportGame on 172.17.0.100  is down" |mail -s "8052/CimBetSportGame on 172.17.0.100  is down" $mail
done
fi
#CimBetTimingTask for 172.17.0.100
stat61=`curl -s 172.17.0.100:8062/CimBetTimingTask/test.jsp`
if [ "$stat61" = "1" ];then
echo "when $date 8062/CimBetTimingTask on 172.17.0.100  is ok" >> /data/shell/log/check-notice.log
else
echo "when $date 8062/CimBetTimingTask on 172.17.0.100  is down" >> /data/shell/log/check-notice.log
#for mail in {"@163.com","@qq.com","@qq.com","@qq.com"}
for mail in {"@qq.com","1302129332@qq.com"}
do
echo "when $date 8062/CimBetTimingTask on 172.17.0.100  is down" |mail -s "8062/CimBetTimingTask on 172.17.0.100 is down" $mail
done
fi
#CimBetNotifyProtocol for 172.17.0.100
stat71=`curl -s 172.17.0.100:8072/CimBetNotifyProtocol/test.jsp`
if [ "$stat71" = "1" ];then
echo "when $date 8072/CimBetNotifyProtocol on 172.17.0.100  is ok" >> /data/shell/log/check-notice.log
else
echo "when $date 8072/CimBetNotifyProtocol on 172.17.0.100  is down" >> /data/shell/log/check-notice.log
#for mail in {"@163.com","@qq.com","@qq.com","@qq.com"}
for mail in {"@qq.com","1302129332@qq.com"}
do
echo "when $date 8072/CimBetNotifyProtocol on 172.17.0.100  is down" |mail -s "8072/CimBetNotifyProtocol on 172.17.0.100 is down" $mail
done
fi
#CimBetManager for 172.17.0.100
stat81=`curl -s 172.17.0.100:8082/CimBetManager/test.jsp`
if [ "$stat81" = "1" ];then
echo "when $date 8082/CimBetManager on 172.17.0.100  is ok" >> /data/shell/log/check-notice.log
else
echo "when $date 8082/CimBetManager on 172.17.0.100  is down" >> /data/shell/log/check-notice.log
#for mail in {"@163.com","@qq.com","@qq.com","@qq.com"}
for mail in {"@qq.com","1302129332@qq.com"}
do
echo "when $date 8082/CimBetManager on 172.17.0.100  is down" |mail -s "8082/CimBetManager on 172.17.0.100 is down" $mail
done
fi
echo "==============================$date is over==============================" >> /data/shell/log/check-notice.log



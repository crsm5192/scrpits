#!/bin/sh
echo -e "Input the keyword:"
read keyword
echo -e "Input the logfile(full_path)like:
/data/8012_CBATomcat/logs/logfile
/data/8022_CBBTomcat/logs/logfile
/data/8032_CBPTomcat/logs/logfile
/data/8042_CBPTomcat/logs/logfile
/data/8052_CBSGTomcat/logs/logfile
/data/8062_CBTTTomcat/logs/logfile
/data/8072_CBNPTomcat/logs/logfile
/data/8082_CBMTomcat/logs/logfile"
read logfile
#logfile=2.txt
#keywork=ERROR
time=$(date +"%Y-%m-%d")
for linenum in `cat -n $logfile | grep $keyword|awk '{print $1}'`
do
num1=$[$linenum-100]
num2=$[$linenum+100]
sed -n "$num1","$num2"p $logfile >> /data/shell/tmplog/log-$linenum-$time.txt
done

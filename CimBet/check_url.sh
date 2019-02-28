#!/bin/bash  

RETVAL=0  
SCRIPTS_PATH="/server/scripts" 
# web detection function 
MAIL_GROUP=
LOG_FILE="/tmp/web_check.log" 

Get_URL_Status(){  
FAILCOUNT=0  

#if 3 times then send mail.  
for (( i=1 ; $i <= 3 ; i++ ))   
   do   
	wget -T 15 --tries=1 --spider http://${1} >/dev/null 2>&1  
	if [ $? -ne 0 ]  
         then
		let FAILCOUNT+=1;  
	fi  
done

if [ $FAILCOUNT -gt 1 ]  
     then   
	RETVAL=1  
	NOW_TIME=`date +"%m-%d %H:%M:%S"`  
	SUBJECT_CONTENT="http://${HOST_NAME} service is error,${NOW_TIME}." 
	echo "send to :$MAIL_USER ,Title:$SUBJECT_CONTENT" >$LOG_FILE  
	for MAIL_USER  in $MAIL_GROUP
	    do  
		mail -s "$SUBJECT_CONTENT" $MAIL_USER <$LOG_FILE
		#sh $SCRIPTS_PATH/sms_send $SUBJECT_CONTENT $MAIL_USER
	    done  
else
	RETVAL=0
fi
return $RETVAL
}
#function end.

[ ! -d "$SCRIPTS_PATH" ] && {  
    mkdir -p $SCRIPTS_PATH  
}  


du $SCRIPTS_PATH/domain.list |grep "^0"
FILEVALUE=`echo $?`
[ $FILEVALUE -eq 0 ] && {  
cat >$SCRIPTS_PATH/domain.list<<EOF
EOF
}
#service check   
for  HOST_NAME in `cat $SCRIPTS_PATH/domain.list`  
   do  
       echo -n "checking $HOST_NAME: " 
       Get_URL_Status $HOST_NAME && echo ok||echo no 
       #Get_URL_Status $HOST_NAME  
done 

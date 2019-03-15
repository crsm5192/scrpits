#!/bin/bash
date=`date +'%Y%m%d %R:%S'`
syn_floder=/data/imageServer/imgs/ybyz_tmp
file_type=l
live_min=+5
echo "${date} delete soft_link in ${syn_floder}" >> /data/imageServer/logs/imageserver_link_delete.log
echo "link_name:" >> /data/imageServer/logs/imageserver_link_delete.log
echo "`find ${syn_floder} -type ${file_type} -mmin ${live_min}`" >> /data/imageServer/logs/imageserver_link_delete.log
find ${syn_floder} -type ${file_type} -mmin ${live_min}|xargs rm -rf

#!/bin/bash
date=`date +'%Y%m%d %R:%S'`
#mkdir -p /data/imageServer/imgs/ybyz_tmp/$date
source_str=$1
target_str=`echo ${source_str/source\/*\//}`
source_file=/data/imageServer/imgs/ybyz/$source_str
target_file=/data/imageServer/imgs/ybyz_tmp/$target_str
#echo $source_file
#echo $target_file
echo "${date} ${source_file} linkto ${target_file}" >> /data/imageServer/logs/imageserver_link.log
ln -s  $source_file $target_file &>> /data/imageServer/logs/imageserver_link.log 

#!/bin/sh
IP="192.168.2.222"

cd /www/html/

rm -rf file
mkdir -p file/basic
mkdir -p file/nms

cd /www/html/file/basic
tftp -g -r web_edimax_smb/lang/basic/uk.js  $IP

cd /www/html/file/nms
tftp -g -r web_edimax_smb/lang/nms/uk.js $IP 

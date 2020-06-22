#!/bin/bash
#Description

#Date: 6/23/2020
#Author: wantongtang

# 查看本机ip：curl -s http://ddns.oray.com/checkip | grep -oE  "([[:digit:]]+\.*)+"

#--------------config-------------
user=username #Your Oray username
passwd=password  #Your Oray password
hostname=hostname.com   #Your bounded domain. If there are more than one domain, separate by ','

#--------------Process-----------

oldIP=`cat ddns_cur_ip.dat`
curExIP=`curl http://members.3322.org/dyndns/getip | tee ddns_cur_ip.dat`

if [ "$curExIP" != "$oldIP" ];then
    echo "Refresh IP from $oldIP to: $curExIP"
    orayHttpAdd="http://ddns.oray.com/ph/update?hostname=ikuai1.imwork.net&myip=$curExIP"
    curl -u $user:$passwd  $orayHttpAdd
else
    echo "No change on external IP - $curExIP"
fi



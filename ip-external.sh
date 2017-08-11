#! /bin/bash
#requires dnsutils, geoip-database
#optional geoip-database-extra


myip=`dig myip.opendns.com @resolver1.opendns.com +short`
echo $myip
geoiplookup $myip

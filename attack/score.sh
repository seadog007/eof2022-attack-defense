#!/bin/bash

curl -s 'http://chals2.eof.ais3.org:8000/api/flag' -H 'Content-type: application/json' -H 'Token: a905216e137d838ae9add65838736216' --data '{"id": '$1', "flag": "'$2'"}'


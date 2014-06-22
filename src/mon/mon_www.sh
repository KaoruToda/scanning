#!/bin/sh
#
# mon_www.sh
# Copyright (C) 2014 kaoru <kaoru@bsd>
#

# usage
# sh mon_www.sh http://localhost/ http://localhost/nofound http://nodomain/

SLEEP_SEC=3
SLEEP=sleep

if [ $# -eq 0 ]; then
	TARGET=http://localhost/
else
	TARGET="$@"
fi

MSG_NG='[NG]'
MSG_OK='[OK]'

while :
do
	#curl -s -I $URL | head -1 | grep -v 200
	#R=`curl -s -I $URL | head -1 | grep -v 200`
	for url in $TARGET
	do
		CURL_RESULT=`curl -s -I $url`
		if [ $? -ne 0 ]; then
			echo $MSG_NG $url 'can not connect'
			continue
		fi
		#echo "$CURL_RESULT"
		HTTP_STATUS=`echo "$CURL_RESULT" | head -1`
		#echo status $HTTP_STATUS
		# test only
		if [ 1 -eq 0 ]; then
			echo http status
			echo $url
			echo ====
			echo "$HTTP_STATUS"
			echo ====
			echo "$CURL_RESULT"
			echo ====
		fi

		echo "$HTTP_STATUS" | grep 200 > /dev/null
		if [ $? -eq 0 ]; then
			echo $MSG_OK $url
		else
			echo $MSG_NG $url "$HTTP_STATUS"
		fi
	done

	$SLEEP $SLEEP_SEC
done

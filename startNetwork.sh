#!/bin/bash

N=$1

./cleanup.sh ${N}

set -e

for i in $(seq 0 ${N}); do
	LINK=""
	PORT=""
	
	if [ ${i} -ge 2 ]; then
		LINK="--link fibo$[$i-2]:fibo$[$i-2] --link fibo$[$i-1]:fibo$[$i-1]"
	fi
	if [ ${i} -ge ${N} ]; then
		PORT="-p 8000:8000"
	fi

	docker run --name fibo${i} ${LINK} ${PORT} -d dgageot/fiboweb ${i}
done

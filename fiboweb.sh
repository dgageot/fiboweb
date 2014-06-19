#!/bin/bash

if [ $1 -le 0 ]; then
	echo "0" > index.html
	python -m SimpleHTTPServer
	exit 1
fi

if [ $1 -le 1 ]; then
	echo "1" > index.html
	python -m SimpleHTTPServer
	exit 1
fi

N2=$(wget -q -O - --retry-connrefused http://fibo$[$1-2]:8000/)
N1=$(wget -q -O - --retry-connrefused http://fibo$[$1-1]:8000/)
echo "$[$N1+$N2]" > index.html
python -m SimpleHTTPServer

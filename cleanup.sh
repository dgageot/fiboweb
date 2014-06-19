#!/bin/bash

N=$1
ALL=$(eval echo fibo{0..$N})

docker kill ${ALL}
docker rm ${ALL}

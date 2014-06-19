#!/bin/bash

N=$1

for i in $(seq 0 ${N}); do
	docker kill fibo${i}
	docker rm fibo${i}
done
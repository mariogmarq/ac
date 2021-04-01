#!/bin/bash
sizes=(8388608 16777216 33554432 67108864)

for i in "${sizes[@]}"; do
	time ./listado1 $i
done

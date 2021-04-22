#!/bin/bash

# Script para atcgrid

echo "atcgrid1-3"
vec=(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,32)
for i in "${vec[@]}"; do
		echo $i
		srun -c$i -n1 -pac ./a.out 7000
		srun -c$i -n1 -pac ./a.out 50000
done
echo "atcgrid4"
for i in "${vec[@]}"; do
		echo $i
		srun -c$i -n1 -p ac4 ./a.out 7000
		srun -c$i -n1 -p ac4 ./a.out 50000
done

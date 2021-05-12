#!/bin/bash

echo "STATIC default"
export OMP_SCHEDULE="static"
./a.out 13824
./a.out 13824

echo "STATIC 1"
export OMP_SCHEDULE="static,1"
./a.out 13824
./a.out 13824

echo "STATIC 64"
export OMP_SCHEDULE="static,64"
./a.out 13824
./a.out 13824


echo "monotonic:dynamic default"
export OMP_SCHEDULE="monotonic:dynamic"
./a.out 13824
./a.out 13824

echo "monotonic:dynamic 1"
export OMP_SCHEDULE="monotonic:dynamic,1"
./a.out 13824
./a.out 13824

echo "monotonic:dynamic 64"
export OMP_SCHEDULE="monotonic:dynamic,64"
./a.out 13824
./a.out 13824


echo "monotonic:guided default"
export OMP_SCHEDULE="monotonic:guided"
./a.out 13824
./a.out 13824

echo "monotonic:guided 1"
export OMP_SCHEDULE="monotonic:guided,1"
./a.out 13824
./a.out 13824

echo "monotonic:guided 64"
export OMP_SCHEDULE="monotonic:guided,64"
./a.out 13824
./a.out 13824

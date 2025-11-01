#!/bin/sh

for i in $(seq 1 5); do
   yc compute instance stop my-vm
   yc compute instance delete my-vm
done

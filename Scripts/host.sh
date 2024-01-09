#!/bin/bash

for ip in $(seq 1 20); 
do
arping -c 1  192.168.0.$ip | grep "64 bytes"
done

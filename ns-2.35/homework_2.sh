#!/bin/bash
# This script helps to run ns2 multiple times
num_times=7
packet_size=64
counter=2
for (( i=0; i<=$num_times; i++ ))
do
echo "Running: $i of $num_times with size $packet_size"
 packet_size=packet_size*2
 echo "$packet_size"
 echo "-------------------------"
 # run simulator
 ns MCS_8001_example1.tcl $packet_size
 
done

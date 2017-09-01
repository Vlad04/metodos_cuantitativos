#!/bin/bash
# This script helps to run ns2 multiple times
num_times=7
packet_size=64
counter=2
for (( i=1; i<=$num_times; i++ ))
do
 echo "Running: $i of $num_times with size $packet_size"
 echo "actual size: $packet_size"
  ns MCS_8001_example1.tcl $packet_size
 packet_size=$(($packet_size * $counter))
 echo "-------------------------"
 # run simulator

 


 
done

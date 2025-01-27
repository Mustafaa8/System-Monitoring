#!/bin/bash
set -e

df 
usage_list=$( df | awk '{print $5}' )
index=0
for i in "$usage_list"
do
	echo $i
	if [[ $i -ge 80 ]]
	then
		echo "Warning : $( df | awk -v index=${index} 'NR==index {print $1}' ) is above 80% Usage"
	fi
	index= $(( index+1 ))
done

#!/bin/bash
set -e
echo "System Monitoring Alert - `date +"%Y-%m-%d %H:%M:%S"`\n"
echo "================================================================\n"
echo "Disk Usage: \n"
df 
usage_list=$( df | awk 'NR > 1 {print $5}' )
index=1
for i in $usage_list;do
	if [ ${i%"%"} -ge 80 ];then
		echo "Warning : `df | awk -v ch_index=${index} 'NR == "ch_index" {print $1}'` is above 80% Usage"
	fi
	index=$(( index + 1 ))
done

echo "CPU Usage: \n"


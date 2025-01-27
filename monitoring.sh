#!/bin/bash
set -e
echo "System Monitoring Alert - `date +"%Y-%m-%d %H:%M:%S"`\n"
echo "================================================================\n"
echo "Disk Usage: "
df 
usage_list=$( df | awk 'NR > 1 {print $5}' )
index=1
for i in $usage_list;do
	if [ ${i%"%"} -ge 80 ];then
		echo "Warning : `df | awk -v ch_index=${index} 'NR == "ch_index" {print $1}'` is above 80% Usage"
	fi
	index=$(( index + 1 ))
done

echo "\nCPU Usage: "
echo "Current CPU usage: `top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}'`"

echo "\nMemory Usage"

echo "Total Memory: `free -g | awk 'NR == 2 {print $2}'`GB"
echo "Free Memory: `free -g | awk 'NR == 2 {print $4}'`GB"
echo "Used Memory: `free -g | awk 'NR == 2 {print $3}'`GB"
echo "\n top 5 Memory-consuming Processes: "
ps -eo user,pid,%mem,command --sort=%mem | head -n 6

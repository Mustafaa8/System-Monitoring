#!/bin/bash
set -e

filename="/var/log/monitoring.log"
threshold=80
while [ $# -ne 0 ]
do
	if [ $1 = "-t" ]
	then
		shift
		threshold=$1
		shift
	
	elif [ $1 = "-f" ]
	then
		shift
		filename=$1
		shift
	else
		shift 
		shift
	fi
done


exec > $filename 2>&1

echo "System Monitoring Alert - `date +"%Y-%m-%d %H:%M:%S"`\n"
echo "================================================================\n"
echo "Disk Usage: "
echo "`df`\n" 
usage_list=$( df | awk 'NR > 1 {print $5}' )
index=1
for i in $usage_list;do
	if [ ${i%"%"} -ge $threshold ];then
		text=`df | awk -v ch_index=${index} 'NR == ch_index {print $1}'`
		echo "$( tput setaf 1 )Warning : ${text} is above ${threshold}% Usage$( tput sgr0 )"
	fi
	index=$(( index + 1 ))
done

echo "\nCPU Usage: "
echo "Current CPU usage: `top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}'`"

echo "\nMemory Usage"

echo "Total Memory: `free -g | awk 'NR == 2 {print $2}'`GB"
echo "Free Memory: `free -g | awk 'NR == 2 {print $4}'`GB"
echo "Used Memory: `free -g | awk 'NR == 2 {print $3}'`GB"
echo "\nTop 5 Memory-consuming Processes: "
ps -eo user,pid,%mem,command --sort=%mem | head -n 6


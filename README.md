# System Monitoring
it is a script written in bash that track system metrices like disk usage , memory usage , CPU usage ... etc. 
script was written in bash with no external libraries or commands to be installed

## Features
1. Check Disk Usage:
  • Report the percentage of disk space used for each mounted partition.
  • Warn if usage exceeds a specified threshold (e.g., 80%).
2. Check CPU Usage:
  • Display the current CPU usage as a percentage.
3. Check Memory Usage:
  • Show total, used, and free memory.
4. Check Running Processes:
  • Display the top 5 memory-consuming processes.
5. Generate a Report:
  • Save the collected information into a log file (e.g., system_monitor.log).

## Usage
1. we need to clone the repo
```bash
git clone https://github.com/Mustafaa8/System-Monitoring.git
```
2. then there are two option
- running using the shell
```bash
sudo sh monitoring.sh 
```
- or using cron jobs
```bash
sudo croptab -e 
```
and add it to the file using cron syntax to schedule the running of the script 

Example:
```cron
* * * * * sudo sh ~/System-Monitoring/monitoring.sh 
```
## Options
the script has two options to change how it runs
1. `-t` : to define the threshold for the disk usage . if the disk usage is higher than it , it gives a warning => default:80%
2. `-f` : to define the file in which the output will be => default :/var/log/monitoring
## Screenshots from the output 
### Script
![Capture1](https://github.com/user-attachments/assets/45732e13-8951-4d5a-8b86-2c09beeb427a)
### Result without defining threshold
![Capture2](https://github.com/user-attachments/assets/071f1046-a09d-4472-95f0-7c998d9cfc58)
### Result with defining threshold (-t 50)
![Capture3](https://github.com/user-attachments/assets/b4a0d1fb-5fae-48fb-973c-f06a3a5d4821)


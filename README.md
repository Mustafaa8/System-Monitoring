# System Monitoring
it is a script written in bash that track system metrices like disk usage , memory usage , CPU usage ... etc. 
script was written in bash with no external libraries or commands to be installed

## usage
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
* * * * * sudo sh ~/monitoring.sh 
```
## Options
the script has two options to change how it runs
1. `-t` : to define the threshold for the disk usage . if the disk usage is higher than it , it gives a warning => default:80%
2. `-f` : to define the file in which the output will be => default :/var/log/monitoring

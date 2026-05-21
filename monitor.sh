#!/bin/bash

LOGFILE="system_health.log"

echo "==================================" >> $LOGFILE
echo "System Health Check - $(date)" >> $LOGFILE
echo "==================================" >> $LOGFILE

# CPU Usage
CPU=$(top -bn1 | grep "Cpu" | awk '{print $2}' | cut -d. -f1)

if [ $CPU -gt 80 ]
then
   echo "WARNING: High CPU Usage - $CPU%" >> $LOGFILE
fi

# Memory Usage
echo "" >> $LOGFILE
echo "Memory Usage:" >> $LOGFILE
free -m >> $LOGFILE

# Disk Usage
echo "" >> $LOGFILE
echo "Disk Usage:" >> $LOGFILE
df -h >> $LOGFILE

# Running Processes
echo "" >> $LOGFILE
echo "Top Processes:" >> $LOGFILE
ps aux --sort=-%mem | head >> $LOGFILE

# System Uptime
echo "" >> $LOGFILE
echo "System Uptime:" >> $LOGFILE
uptime >> $LOGFILE

echo "" >> $LOGFILE
echo "Health Check Completed" >> $LOGFILE

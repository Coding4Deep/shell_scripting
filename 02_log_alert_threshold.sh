#!/bin/bash

#2. Monitor a log file in real-time and alert if "ERROR" or "CRITICAL" 
#   appears more than N times in 1 minute.

LOG_FILE=${1:-/var/logs/mylog.log}
THRESOLD=${2:-10}
TIMER=${3:-1}

if [ -f "$LOG_FILE" ]; then
   while true; do
     COUNT=${tail -n 1000 "$LOG_FILE" | grep -E "ERROR|CRITICAL" | wc -l}
     if [ ${COUNT} -gt ${THRESOLD} ]; then
        mail -s example@mail.com -m "......."
     fi
     sleep .....
   done
fi





LOGDIR="${1:-/var/log}"
THRESHOLD="${2:-5}"

for log_file in "$LOGDIR"/*; do
    if [ -f "$log_file" ]; then
        while true; do
            COUNT=$(tail -n 1000 "$log_file" | grep -E "ERROR|CRITICAL" | wc -l)
            if [ "$COUNT" -gt "$THRESHOLD" ]; then
                echo "ALERT: $COUNT ERROR/CRITICAL entries in $log_file in the last minute!" # | mail -s "Log Alert" your_email@example.com
            fi
            sleep 60
        done &
    fi
done
wait
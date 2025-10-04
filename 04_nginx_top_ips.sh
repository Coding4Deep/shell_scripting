#!/bin/bash

# 4. Parse an Apache/Nginx log file and find the **IP addresses with the most requests**

LOG_FILE=${1:-testing.log}
awk '{print $1}' "$LOG_FILE" 
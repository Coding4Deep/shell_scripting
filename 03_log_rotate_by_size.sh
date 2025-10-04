#!/bin/bash

#3. Write a script to **rotate logs** when size exceeds 100MB, 
#   compress old logs, and keep only the last 7 days.

IFS=$'\n\t'


# Minimum file size (100 KB)
MIN_SIZE="+1k"

# Age in days (7 days)
# MIN_AGE="+7"
# find "$LOG_DIR" -type f -size $MIN_SIZE -mtime $MIN_AGE ! -name "*.gz" -exec gzip {} \; 
LOG_DIR="${1:-/home/kafka/shell_ans/test/devops-shell-practice}"
# find "$LOG_DIR" -type f  -name "*.gz" -exec gunzip {} \;
zip logs-archive.zip $(find "$LOG_DIR" -type f -name "*.sh")

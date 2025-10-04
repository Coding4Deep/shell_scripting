#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Detect zombie processes (STAT Z)
ps -eo pid,ppid,stat,comm | awk '$3 ~ /Z/'
# To clean, you typically need to signal the parent PID (PPID) cautiously:
# ps -eo pid,ppid,stat,comm | awk '$3 ~ /Z/ {print $2}' | xargs -r kill -HUP

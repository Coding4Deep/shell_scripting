#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Parse access log and output top IPs
# Usage: "$0" /var/log/nginx/access.log [N]
LOG=${1:?access log}
N=${2:-20}
awk '{print $1}' "$LOG" | sort | uniq -c | sort -nr | head -n "$N"

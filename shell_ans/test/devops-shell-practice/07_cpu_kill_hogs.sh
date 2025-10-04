#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Kill processes consuming more than LIMIT% CPU
# Usage: "$0" [LIMIT]
LIMIT=${1:-90}
ps -eo pid,pcpu,comm --sort=-pcpu | awk -v L="$LIMIT" 'NR>1 && $2 > L {print $1}' | while read -r pid; do
  echo "Killing PID $pid" >&2
  kill -9 "$pid" || true
done

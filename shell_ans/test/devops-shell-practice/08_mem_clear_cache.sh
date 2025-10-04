#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Clear OS caches if MemAvailable < MIN_KB (Linux only)
# Usage: "$0" [MIN_KB]
MIN=${1:-512000}
avail=$(awk '/MemAvailable/ {print $2}' /proc/meminfo)
if (( avail < MIN )); then
  sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'
  echo "Caches dropped"
fi

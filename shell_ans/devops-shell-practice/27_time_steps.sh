#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Measure time taken by each command passed; prints durations
# Usage: "$0" 'cmd1' 'cmd2' ...
for cmd in "$@"; do
  start=$(date +%s)
  bash -lc "$cmd"
  dur=$(( $(date +%s) - start  ))
  echo "TIME ${dur}s :: $cmd"
done

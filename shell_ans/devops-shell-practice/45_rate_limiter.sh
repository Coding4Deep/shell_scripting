#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Token bucket rate limiter: allow N requests per WINDOW seconds
# Usage: "$0" N WINDOW 'command'
N=${1:-100}; WIN=${2:-60}; shift 2
bucket=$N; last=$(date +%s)
while true; do
  now=$(date +%s); delta=$((now-last)); last=$now
  add=$((delta*N/WIN)); bucket=$((bucket+add)); (( bucket>N )) && bucket=$N
  if (( bucket>0 )); then
    bucket=$((bucket-1)); bash -lc "$*" || true
  else
    sleep 1
  fi
done

#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Retry a command with exponential backoff
# Usage: "$0" MAX_RETRIES 'command with args'
MAX=${1:-5}; shift
i=0
until bash -lc "$*"; do
  i=$((i+1)); (( i>MAX )) && exit 1
  sleep $((2**i))
done

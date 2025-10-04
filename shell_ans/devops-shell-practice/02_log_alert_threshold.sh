#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Tail a log and alert if KEY appears more than LIMIT times within WINDOW seconds.
# Usage: "$0" /path/to/log KEY LIMIT WINDOW_SECONDS
LOG=${1:?log path}
KEY=${2:?keyword}
LIMIT=${3:-5}
WINDOW=${4:-60}

tail -Fn0 "$LOG" | awk -v key="$KEY" -v limit="$LIMIT" -v window="$WINDOW" '
BEGIN { start = systime(); count=0 }
{ if (index($0, key)) { count++ }; now = systime(); if (now - start >= window) { if (count > limit) { printf("ALERT: %s seen %d times in last %d sec\n", key, count, window) | "cat 1>&2" }; start=now; count=0 } }'

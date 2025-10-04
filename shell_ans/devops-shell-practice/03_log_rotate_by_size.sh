#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Rotate logs when size exceeds threshold (bytes). Keep last 7 gzipped rotations by date.
# Usage: "$0" /path/to/log 104857600
LOG=${1:?log file}
THRESH=${2:-104857600} # 100MB
[ -f "$LOG" ] || exit 0
SIZE=$(stat -c%s "$LOG")
if (( SIZE > THRESH )); then
  ts=$(date +%Y%m%d-%H%M%S)
  mv "$LOG" "$LOG.$ts"
  : > "$LOG"
  gzip -9 "$LOG.$ts"
  ls -1t "$LOG".*.gz 2>/dev/null | tail -n +8 | xargs -r rm -f
fi

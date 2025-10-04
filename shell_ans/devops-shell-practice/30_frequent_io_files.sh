#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Show files with frequent IO via lsof sampling
# Usage: "$0" [SECONDS] [SAMPLES]
SEC=${1:-1}; SAMPLES=${2:-5}
tmp=$(mktemp)
for i in $(seq 1 "$SAMPLES"); do
  lsof -Fn | grep '^n/' >> "$tmp" || true
  sleep "$SEC"
done
sort "$tmp" | uniq -c | sort -nr | head
rm -f "$tmp"

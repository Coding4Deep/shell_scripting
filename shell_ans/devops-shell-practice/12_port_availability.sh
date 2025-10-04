#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Test host:port reachability from a list; prints failures
# Usage: "$0" targets.txt  (lines like host:port)
while read -r hp; do
  [ -z "$hp" ] && continue
  host=${hp%%:*}; port=${hp##*:}
  timeout 3 bash -c ">/dev/tcp/$host/$port" 2>/dev/null || echo "FAIL $host:$port"
done < "${1:?targets}"

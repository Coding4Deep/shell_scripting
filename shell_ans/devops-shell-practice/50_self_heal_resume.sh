#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Self-healing script with checkpoints
# Usage: "$0"
STATE=.checkpoint
step(){ echo "$1" > "$STATE"; }
curr=$(cat "$STATE" 2>/dev/null || echo 0)
if [[ "$curr" -lt 1 ]]; then
  echo "Step 1"; sleep 1; step 1
fi
if [[ "$curr" -lt 2 ]]; then
  echo "Step 2"; sleep 1; step 2
fi
if [[ "$curr" -lt 3 ]]; then
  echo "Step 3"; rm -f "$STATE"; echo "DONE"
fi

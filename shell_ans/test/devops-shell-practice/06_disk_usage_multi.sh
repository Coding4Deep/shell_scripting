#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Check disk usage and email/print alert if any filesystem > THRESH%
# Usage: "$0" [THRESH] [EMAIL]
THRESH=${1:-80}
EMAIL=${2:-}
df -PTh | awk -v t="$THRESH" 'NR>1 {gsub("%","",$6); if($6>t) print}' | tee /tmp/disk_alert.txt
if [ -s /tmp/disk_alert.txt ]; then
  if [ -n "$EMAIL" ] && command -v mail >/dev/null; then
    mail -s "Disk usage alert" "$EMAIL" </tmp/disk_alert.txt
  fi
fi

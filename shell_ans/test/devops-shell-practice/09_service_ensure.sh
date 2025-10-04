#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Ensure service is running; restart and log if down
# Usage: "$0" nginx
SVC=${1:?service}
LOG=${LOG:-/var/log/service-ensure.log}
if ! systemctl is-active --quiet "$SVC"; then
  echo "$(date -Is) restarting $SVC" | tee -a "$LOG"
  systemctl restart "$SVC"
fi

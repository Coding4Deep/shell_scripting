#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Deploy new release; rollback if health check fails
# Usage: "$0" /srv/app http://127.0.0.1/health repo_url
APPDIR=${1:?}; HEALTH=${2:?}; REPO=${3:?}
prev=$(readlink -f "$APPDIR/current" || true)
"$(dirname "$0")/21_zero_downtime_deploy.sh" "$APPDIR" "$REPO"
sleep 5
code=$(curl -s -o /dev/null -w '%{http_code}' "$HEALTH" || echo 000)
if [[ "$code" != "200" ]]; then
  echo "Rollback to $prev"
  [ -n "$prev" ] && ln -sfn "$prev" "$APPDIR/current"
fi

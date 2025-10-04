#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Ensure required Docker containers are running
# Usage: "$0" container1 container2 ...
missing=0
for c in "$@"; do
  if ! docker ps --format '{{.Names}}' | grep -qx "$c"; then
    echo "Starting $c"
    docker start "$c" || missing=1
  fi
done
exit $missing

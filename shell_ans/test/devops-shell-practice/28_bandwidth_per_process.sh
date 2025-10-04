#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Approximate bandwidth per process using nethogs (if present) or /proc
# Usage: "$0"
if command -v nethogs >/dev/null; then
  sudo nethogs -t -c 1
else
  echo "nethogs not installed; fallback not implemented"
fi

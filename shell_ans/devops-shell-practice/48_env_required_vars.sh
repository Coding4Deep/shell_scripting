#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Validate required env vars
# Usage: REQUIRED='DB_USER,DB_PASS,API_KEY' "$0"
IFS=',' read -ra keys <<< "${REQUIRED:?set REQUIRED comma-separated}"
ok=0
for k in "${keys[@]}"; do
  k=$(echo "$k" | xargs)
  [ -n "${!k:-}" ] || { echo "Missing env var: $k" >&2; ok=1; }
done
exit $ok

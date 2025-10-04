#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Check key=value consistency across files
# Usage: "$0" file1.env file2.env ...
declare -A first
for f in "$@"; do
  while IFS='=' read -r k v; do
    [[ -z "$k" || "$k" =~ ^# ]] && continue
    if [[ -z "${first[$k]+x}" ]]; then
      first[$k]="$v"
    elif [[ "${first[$k]}" != "$v" ]]; then
      echo "Mismatch for $k: $v in $f, expected ${first[$k]}"
    fi
  done < "$f"
done

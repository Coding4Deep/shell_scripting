#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Detect palindrome strings from file (one per line)
# Usage: "$0" input.txt
while IFS= read -r s; do
  r=$(echo "$s" | rev)
  [[ "$s" == "$r" ]] && echo "$s"
done < "${1:?file}"

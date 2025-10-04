#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Split huge CSV without breaking header; chunk lines (default 1M)
# Usage: "$0" file.csv [LINES_PER_FILE]
FILE=${1:?}; LINES=${2:-1000000}
header=$(head -n1 "$FILE")
tail -n +2 "$FILE" | split -l "$LINES" - "$FILE.part."
for f in "$FILE".part.*; do
  ( echo "$header"; cat "$f" ) > "$f.csv"
  rm -f "$f"
done

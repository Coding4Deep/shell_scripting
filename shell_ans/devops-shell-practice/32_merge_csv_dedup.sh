#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Merge CSV files with same header; deduplicate full rows
# Usage: "$0" out.csv file1.csv file2.csv ...
OUT=${1:?}; shift
{
  head -n1 "$1"
  for f in "$@"; do tail -n +2 "$f"; done
} | sort | uniq > "$OUT"

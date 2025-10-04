#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Validate YAML/JSON files
# Usage: "$0" file1 [file2...]
status=0
for f in "$@"; do
  case "$f" in
    *.json) jq empty "$f" || status=1 ;;
    *.yml|*.yaml) python3 -c 'import sys,yaml;yaml.safe_load(open(sys.argv[1]))' "$f" || status=1 ;;
    *) echo "Unknown type: $f" >&2 ; status=1 ;;
  esac
done
exit $status

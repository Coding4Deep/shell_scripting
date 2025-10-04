#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Very simple JSON parse using python (no jq), echo a key path
# Usage: "$0" file.json key1.key2.key3
python3 - "$1" "$2" <<'PY'
import sys, json
data=json.load(open(sys.argv[1]))
path=sys.argv[2].split('.')
for k in path:
    data=data[k]
print(data)
PY

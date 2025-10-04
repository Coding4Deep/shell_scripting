#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Find duplicate files by checksum within DIR
# Usage: "$0" DIR
DIR=${1:-.}
find "$DIR" -type f -print0 | xargs -0 sha256sum | sort | awk '{hash=$1; $1=""; sub(/^\s+/,""); a[hash]=a[hash] ? a[hash]"\n"$0 : $0} END {for (h in a) { split(a[h], arr, "\n"); if (length(arr)>1) { print "# DUPLICATES for " h; for (i in arr) print arr[i]; print "" } } }'

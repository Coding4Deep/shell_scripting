#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Find top N largest regular files in a directory tree (default: 10), ignoring symlinks
# Usage: "$0" [DIR] [N]
DIR=${1:-.}
N=${2:-10}
find "$DIR" -xdev -type f -printf '%s %p\n' 2>/dev/null | sort -nr | head -n "$N" | awk '{size=$1; $1=""; sub(/^ /,""); printf "%s\t%s\n", size, $0}'

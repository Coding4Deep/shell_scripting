#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Create tar.gz artifact named with short git hash and date
# Usage: "$0" SRC_DIR OUT_DIR
SRC=${1:-.}; OUT=${2:-./dist}
mkdir -p "$OUT"
hash=$(git -C "$SRC" rev-parse --short HEAD 2>/dev/null || echo "nogit")
ts=$(date +%Y%m%d-%H%M%S)
name="artifact_${ts}_${hash}.tar.gz"
tar -C "$SRC" -czf "$OUT/$name" .
echo "$OUT/$name"

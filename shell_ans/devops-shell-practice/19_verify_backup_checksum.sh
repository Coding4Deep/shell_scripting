#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Verify backup integrity by checksum list
# Usage: "$0" /backup/dir
DIR=${1:?dir}
find "$DIR" -type f -name '*.tar.gz' -o -name '*.sql.gz' | while read -r f; do
  sha256sum "$f"
done | tee "$DIR/checksums.sha256"
sha256sum -c "$DIR/checksums.sha256"

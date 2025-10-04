#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Restore latest snapshot from remote rsync snapshots/current
# Usage: "$0" USER@HOST:/base /restore/dir
SRC=${1:?ssh src base}
RESTORE=${2:?restore dir}
latest=$(ssh "$SRC" 'readlink -f current')
rsync -a "$SRC/$latest"/ "$RESTORE"/

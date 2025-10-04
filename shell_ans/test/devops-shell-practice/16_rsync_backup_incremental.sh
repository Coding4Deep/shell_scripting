#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Incremental rsync backup with retention
# Usage: "$0" SRC USER@HOST:/dest KEEP_DAYS
SRC=${1:?src}
DEST=${2:?dest ssh url}
KEEP=${3:-7}
TS=$(date +%F-%H%M%S)
ssh_dest="${DEST%:/}"
rsync -a --delete --link-dest="${ssh_dest}/current" "$SRC"/ "$ssh_dest"/snapshots/"$TS"/
ssh "$ssh_dest" "rm -f current && ln -s snapshots/$TS current && find snapshots -maxdepth 1 -type d -mtime +$KEEP -exec rm -rf {} +"

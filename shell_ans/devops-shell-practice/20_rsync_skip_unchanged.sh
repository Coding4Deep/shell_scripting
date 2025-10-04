#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Rsync skipping unchanged (default behavior), with delete to mirror
# Usage: "$0" SRC DEST
SRC=${1:?src}; DEST=${2:?dest}
rsync -a --delete "$SRC"/ "$DEST"/

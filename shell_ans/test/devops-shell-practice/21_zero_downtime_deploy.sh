#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Zero-downtime deploy via symlink swap
# Usage: "$0" /srv/app repo_url
APPDIR=${1:?app dir}; REPO=${2:?git url}
TS=$(date +%F-%H%M%S)
WORK="$APPDIR/releases/$TS"
git clone --depth 1 "$REPO" "$WORK"
( cd "$WORK" && [ -x ./build.sh ] && ./build.sh )
ln -sfn "$WORK" "$APPDIR/current"
systemctl reload nginx || true

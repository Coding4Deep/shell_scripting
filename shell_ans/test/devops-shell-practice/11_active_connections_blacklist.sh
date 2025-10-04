#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Detect blacklisted IPs among active connections
# Usage: "$0" blacklist.txt
BL=${1:?blacklist file}
comm -12 <(ss -ntuH | awk '{print $5}' | sed 's/:.*//' | sort -u) <(sort -u "$BL")

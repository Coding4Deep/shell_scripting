#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Mask sensitive fields (regex list) in config
# Usage: "$0" config.file
sed -E 's/(password|secret|api_key|token)\s*[:=]\s*[^"\s]+/\1=****/Ig' "${1:?file}"

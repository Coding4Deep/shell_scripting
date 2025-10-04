#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Check URLs for HTTP 200
# Usage: "$0" urls.txt
while read -r url; do
  [ -z "$url" ] && continue
  code=$(curl -s -o /dev/null -w '%{http_code}' "$url" || echo 000)
  [[ "$code" == "200" ]] || echo "$url -> $code"
done < "${1:?urls file}"

#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Check SSL certificate expiry for domains in a file; alert if < DAYS
# Usage: "$0" domains.txt [DAYS]
FILE=${1:?domains list}
DAYS=${2:-10}
while read -r host; do
  [ -z "$host" ] && continue
  end=$(echo | openssl s_client -servername "$host" -connect "$host:443" 2>/dev/null | openssl x509 -noout -enddate | cut -d= -f2)
  sec=$(date -d "$end" +%s 2>/dev/null || date -j -f "%b %d %T %Y %Z" "$end" +%s)
  now=$(date +%s)
  rem=$(( (sec-now)/86400 ))
  if (( rem < DAYS )); then
    echo "$host expires in $rem days"
  fi
done < "$FILE"

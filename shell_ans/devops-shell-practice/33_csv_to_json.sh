#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Convert CSV to JSON array (jq required)
# Usage: "$0" file.csv
csvjson(){ awk -v q='"' -F, '
NR==1{ for(i=1;i<=NF;i++) h[i]=$i; next }
{ printf "{"; for(i=1;i<=NF;i++) { printf "%s%s%s:%s%s%s", (i>1?",":""), q, h[i], q, q, $i q }; print "}" }
' "$1" | sed '1s/^/[\n/;$s/$/\n]/;s/^$/{}/' ; }
csvjson "$1" | jq .

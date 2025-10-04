#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Execute command on multiple servers in parallel via ssh and collect results
# Usage: "$0" hosts.txt 'cmd'
HOSTS=${1:?}; CMD=${2:?}
mkdir -p results
cat "$HOSTS" | xargs -I{} -P 10 bash -lc 'h="{}"; echo "== $h =="; ssh -o BatchMode=yes -o ConnectTimeout=5 "$h" '"$CMD"' > "results/$h.out" 2>&1'
echo "Results in ./results"

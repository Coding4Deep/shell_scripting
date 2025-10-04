#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Top N memory-consuming processes
# Usage: "$0" [N]
N=${1:-10}
ps -eo pid,pmem,comm --sort=-pmem | head -n $((N+1))

#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Run jobs in parallel with max concurrency
# Usage: "$0" MAX < jobs.txt   (each line is a command)
MAX=${1:-4}
sem=/tmp/sem.$$
mkfifo "$sem"; exec 3<>"$sem"; rm "$sem"
for ((i=0;i<MAX;i++)); do echo >&3; done
while IFS= read -r cmd; do
  read -u 3
  ( bash -lc "$cmd"; echo >&3 ) &
done
wait
exec 3>&-

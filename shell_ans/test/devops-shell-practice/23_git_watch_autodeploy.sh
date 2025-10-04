#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Poll a Git repo; redeploy on new commit
# Usage: "$0" REPO_URL POLL_SEC CMD_TO_RUN
REPO=${1:?}; INTERVAL=${2:-30}; CMD=${3:-echo redeploy}
last=""
while true; do
  head=$(git ls-remote "$REPO" HEAD | awk '{print $1}')
  if [[ "$head" != "$last" ]]; then
    echo "Change detected: $head"
    eval "$CMD"
    last="$head"
  fi
  sleep "$INTERVAL"
done

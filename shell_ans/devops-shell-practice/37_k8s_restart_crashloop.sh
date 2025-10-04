#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Restart pods in CrashLoopBackOff (requires kubectl context)
# Usage: "$0" [NAMESPACE]
NS=${1:-default}
kubectl get pods -n "$NS" --no-headers | awk '$3 ~ /CrashLoopBackOff/ {print $1}' | while read -r p; do
  kubectl delete pod "$p" -n "$NS"
done

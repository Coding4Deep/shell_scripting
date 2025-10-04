#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Scan Docker images with trivy and generate JSON report
# Usage: "$0" imagename:tag out.json
IMG=${1:?}; OUT=${2:-trivy_report.json}
trivy image --quiet --format json -o "$OUT" "$IMG"
echo "Report: $OUT"

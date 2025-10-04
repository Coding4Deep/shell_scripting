#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Check helm chart dependencies for updates
# Usage: "$0" PATH_TO_CHART
CHART=${1:-.}
helm dependency update "$CHART" --skip-refresh >/dev/null 2>&1 || true
helm dependency list "$CHART"

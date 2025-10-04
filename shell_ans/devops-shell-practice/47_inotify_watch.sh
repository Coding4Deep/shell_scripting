#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Monitor directory for changes using inotifywait
# Usage: "$0" DIR
DIR=${1:-.}
inotifywait -m -e create,delete,modify,move "$DIR" --format '%T %e %w%f' --timefmt '%F %T'

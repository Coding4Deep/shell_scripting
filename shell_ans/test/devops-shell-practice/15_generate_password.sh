#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Generate strong password with length and complexity
# Usage: "$0" [LEN]
LEN=${1:-20}
tr -dc 'A-Za-z0-9!@#$%^&*()_+-={}[]:;,.?/' </dev/urandom | head -c "$LEN"; echo

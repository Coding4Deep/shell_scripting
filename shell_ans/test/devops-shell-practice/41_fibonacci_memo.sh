#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# nth Fibonacci with memoization (bash 4+ assoc array)
# Usage: "$0" N
declare -A memo
fib(){
  local n=$1
  if (( n<2 )); then echo "$n"; return; fi
  if [[ -n "${memo[$n]:-}" ]]; then echo "${memo[$n]}"; return; fi
  local a=$(fib $((n-1))); local b=$(fib $((n-2)))
  memo[$n]=$((a+b)); echo "${memo[$n]}"
}
fib "${1:?N}"

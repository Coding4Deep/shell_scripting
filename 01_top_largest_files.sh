#!/bin/bash

#1. Write a script to find the **top 10 largest files** in a directory tree (ignoring symlinks)

IFS=$'\n\t'
DIR=${1:-.}
N=${2:-10}
find "$DIR" -type f -exec du -b {} + 2>/dev/null \
  | sort -nr \
  | head -n "$N" \
  | numfmt --to=iec --suffix=B --padding=7

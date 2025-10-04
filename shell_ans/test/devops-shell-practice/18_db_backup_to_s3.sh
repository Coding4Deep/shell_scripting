#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Backup MySQL/Postgres and upload to S3 (aws cli required)
# Usage: "$0" mysql|postgres dbname s3://bucket/prefix
TYPE=${1:?mysql|postgres}
DB=${2:?dbname}
S3=${3:?s3 path}
TS=$(date +%F-%H%M%S)
OUT="/tmp/${DB}_${TS}.sql.gz"
if [[ "$TYPE" == "mysql" ]]; then
  mysqldump "$DB" | gzip -9 > "$OUT"
else
  pg_dump "$DB" | gzip -9 > "$OUT"
fi
aws s3 cp "$OUT" "$S3"/
echo "Uploaded to $S3/$(basename "$OUT")"

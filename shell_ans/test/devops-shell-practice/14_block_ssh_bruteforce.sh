#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Block IPs with >100 failed SSH attempts in last hour via iptables
# Usage: "$0"
logsrc=$(journalctl -u ssh --since '1 hour ago' 2>/dev/null || grep -a 'Failed password' /var/log/auth.log 2>/dev/null)
echo "$logsrc" | awk '/Failed password/ { for(i=1;i<=NF;i++) if ($i=="from") print $(i+1) }' |   sort | uniq -c | awk '$1>100 {print $2}' | while read -r ip; do
    sudo iptables -I INPUT -s "$ip" -j DROP || true
    echo "Blocked $ip"
  done

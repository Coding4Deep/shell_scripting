#!/bin/bash 
# 6. Write a script to **check disk usage** across multiple servers 
#    and send an email if usage > 80%.


# Threshold in percentage
THRESHOLD=80

# List of servers
SERVERS=("ec2-user@<ip1>" "ec2-user@<ip2>")

# Get the IP of the current host
MY_IP=$(curl -s ifconfig.me)

# Loop over servers
for SERVER in "${SERVERS[@]}"; do
    # Extract IP from ec2-user@<ip>
    SERVER_IP="${SERVER#*@}"

    # Check if this is the local server or remote
    if [[ "$SERVER_IP" == "$MY_IP" ]]; then
        # Local disk usage
        USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
    else
        # Remote disk usage via SSH
        USAGE=$(ssh -o BatchMode=yes "$SERVER" "df / | awk 'NR==2 {print \$5}'" | tr -d '%')
    fi

    # Compare usage with threshold
    if (( USAGE > THRESHOLD )); then
        echo "Disk usage on $SERVER is ${USAGE}%, exceeding threshold of $THRESHOLD%" \
            | mail -s "Disk Alert: $SERVER" example@gmail.com
    fi
done

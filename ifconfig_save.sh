#!/bin/bash

IPV4_FILE="/opt/phpcms/ipv4.txt"
IPV6_FILE="/opt/phpcms/ipv6.txt"
OLD_IPV6_FILE="/opt/phpcms/ipv6_old.txt"

# Get IPv4
ip -4 addr show scope global | grep inet | awk '{print $2}' | cut -d/ -f1

# Get global IPv6
ip -6 addr show scope global | grep inet6 | awk '{print $2}' | cut -d/ -f1 > "$IPV6_FILE"

# Compare IPv6 with previous
if [ -f "$OLD_IPV6_FILE" ]; then
    if cmp -s "$IPV6_FILE" "$OLD_IPV6_FILE"; then
        echo "NO_CHANGE" > /opt/phpcms/status.txt
    else
        echo "CHANGED" > /opt/phpcms/status.txt
    fi
else
    echo "FIRST_RUN" > /opt/phpcms/status.txt
fi

# Save current as old
cp "$IPV6_FILE" "$OLD_IPV6_FILE"

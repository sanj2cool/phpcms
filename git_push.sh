#!/bin/bash

STATUS=$(cat /opt/phpcms/status.txt)

if [ "$STATUS" != "CHANGED" ]; then
    echo "No IPv6 change. Skipping push."
    exit 0
fi

cd /opt/phpcms || exit

git add .
git commit -m "IPv6 changed: $(date)"
git push

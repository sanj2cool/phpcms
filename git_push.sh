#!/bin/bash

cd /opt/phpcms || exit 1

git add ifconfig.txt
git commit -m "Auto update ifconfig $(date '+%Y-%m-%d %H:%M:%S')" || exit 0
git push origin main

#!/bin/bash

OUTPUT="/opt/phpcms/ifconfig.txt"
/sbin/ifconfig > "$OUTPUT"

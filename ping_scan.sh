#!/bin/bash

subnet="192.168.1"

for host in {1..254}; do
    ip="${subnet}.${host}"
    (
        ping -c 1 -W 1 "$ip" >/dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "Host $ip is up"
        fi
    ) &
done

wait


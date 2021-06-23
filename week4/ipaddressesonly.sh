#!/bin/bash

ipInfoScript=$HOME/scripts/portfolio/week4/ipinfo.sh

net_info=$("$ipInfoScript")

ipAddressOnly=$(echo "$net_info" | sed -n '/IP Address: / {
    s/\s*//
    p
}')

echo -e "\n$ipAddressOnly\n"

exit 0


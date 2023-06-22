#!/bin/bash

echo "Active Network Card Ports:"
echo "-------------------------"

# Retrieve a list of network interfaces
interfaces=$(ip link show | awk -F': ' '/^[0-9]+:/{print $2}')

# Iterate over each interface and check if it is up
for interface in $interfaces; do
  if [[ $(cat /sys/class/net/$interface/operstate) == "up" ]]; then
    echo "$interface is active."
  else
    echo "$interface is inactive."
  fi
done

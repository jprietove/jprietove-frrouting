#!/bin/bash
set -e

/etc/init.d/quagga start

# Keep the console alive.
while :; do
 echo "------------------------------------------------------"
 echo "Attaching console. To disconnect, press Ctrl-P Ctrl-Q."
 echo "------------------------------------------------------"
 vtysh || :
 sleep 1
done

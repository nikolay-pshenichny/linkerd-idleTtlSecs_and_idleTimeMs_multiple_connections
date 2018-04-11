#!/bin/bash -e

echo "Entered the entrypoint"

# Make sure there's enough time for all other dontainers to start
sleep 20

ctr=1
while [ $ctr -le 10 ]; do
    ./greeter_client $@
    ((ctr++))
done 

while true; do
    sleep 10

    netstat -tanvo
done
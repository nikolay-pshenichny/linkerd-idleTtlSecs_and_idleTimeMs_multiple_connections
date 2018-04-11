#!/bin/bash -e

echo "Entered the entrypoint"

nohup ./greeter_server $@ &


while true; do
    sleep 10

    netstat -tanvo
done
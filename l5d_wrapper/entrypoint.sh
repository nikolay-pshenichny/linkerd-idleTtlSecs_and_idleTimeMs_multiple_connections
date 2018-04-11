#!/bin/bash -e

echo "Entered the entrypoint"

nohup /io.buoyant/linkerd/1.3.7/bundle-exec $@ &

while true; do
    sleep 10

    netstat -tanvo
done
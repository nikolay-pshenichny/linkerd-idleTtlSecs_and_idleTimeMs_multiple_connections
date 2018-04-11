#!/bin/bash -e

docker-compose -f docker-compose.base.dockerComposeScale.yaml -f docker-compose.idleTimeMs.dockerComposeScale.yaml up --build --scale h2-greeter-server=3
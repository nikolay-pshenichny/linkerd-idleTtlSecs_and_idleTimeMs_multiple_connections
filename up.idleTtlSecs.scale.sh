#!/bin/bash -e

docker-compose -f docker-compose.base.dockerComposeScale.yaml -f docker-compose.idleTtlSecs.dockerComposeScale.yaml up --build --scale h2-greeter-server=3
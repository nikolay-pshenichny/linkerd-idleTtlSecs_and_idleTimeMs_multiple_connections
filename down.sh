#!/bin/bash -e

docker-compose -f docker-compose.base.multipleServers.yaml stop
docker-compose -f docker-compose.base.dockerComposeScale.yaml stop
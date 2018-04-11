#!/bin/bash -e

docker-compose -f docker-compose.base.multipleServers.yaml -f docker-compose.idleTimeMs.multipleServers.yaml up --build
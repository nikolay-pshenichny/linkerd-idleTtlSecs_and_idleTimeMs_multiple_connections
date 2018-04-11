#!/bin/bash -e

docker-compose -f docker-compose.base.multipleServers.yaml -f docker-compose.idleTtlSecs.multipleServers.fsNamer.yaml up --build

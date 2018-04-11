## idleTtlSecs and idleTimeMs

NOTE: The tests in this folder create a cluster with **multiple server** instances in it. That creates multiple connections through Linkerd.


The greeter client/server are based on https://github.com/grpc/grpc-go/tree/master/examples


## What's what?

- docker-compose.base.dockerComposeScale.yaml  - relies on `docker-compose up --scale service=num` to scale the service
- docker-compose.base.multipleServers.yaml - relies on multiple service definitions in the base compose yaml

Two different approaches produce different results from the Linkerd's perspective:
- with `dockerComposeScale`, admin UI will show one instance with multiple connections to it
- with `multipleServers`, admin UI will show multiple instances with a single connection to each one of them

The following UP scripts are variations of different Base files and Config files:
- `up.idleTimeMs.multi.sh`
- `up.idleTimeMs.scale.sh`
- `up.idleTtlSecs.multi.sh`
- `up.idleTtlSecs.scale.sh`

## Observations

### `up.idleTimeMs.multi.sh`
`idleTimeMs` with multiple server instances explicitly defined in the docker-compose yaml.

No effect on established connections

### `up.idleTimeMs.scale.sh`
`idleTimeMs` with multiple server instances scaled with `docker-compose up --scale server=3`

No effect on established connections

### `up.idleTtlSecs.multi.sh`
`idleTtlSecs` with multiple server instances explicitly defined in the docker-compose yaml.

Leaves only 1 open connection after the idling timeout. Closes all others
UI shows 3 instances with 1 connection each. and after the timeout 2 instances go away

###  `up.idleTtlSecs.scale.sh`
`idleTtlSecs` with multiple server instances scaled with `docker-compose up --scale server=3`

No effect on established connections. 
UI shows 1 instance with 3 connections. After the timeout the connections don't go away.


## FS.Namer

FS.Namer is added as a separate scenario.
It reuses the  `docker-compose.base.multipleServers.yaml` as the base, but adds `io.l5d.fs` to the dtabs in order to resolve paths to the servers that are explicitly defined in the `docker-compose.base.multipleServers.yaml`

### `up.idleTtlSecs.multi.fsNamer.sh`
`idleTtlSecs` with multiple server instances explicitly defined in the docker-compose yaml, but resolved via the `io.l5d.fs` namer;

No effect on established connections. 
UI shows 1 instance with 3 connections. After the timeout the connections don't go away.



## References
- Related - https://github.com/linkerd/linkerd/issues/1890
FROM golang:1.9

RUN apt update
RUN apt-get install net-tools

WORKDIR /opt/greeter_server
ADD ./main.go ./main.go
ADD ./entrypoint.sh entrypoint.sh

RUN go get -u google.golang.org/grpc
RUN go build

ENTRYPOINT [ "./entrypoint.sh" ]

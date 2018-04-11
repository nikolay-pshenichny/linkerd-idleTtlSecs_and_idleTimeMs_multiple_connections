FROM buoyantio/linkerd:1.3.7

RUN apt update
RUN apt-get install net-tools

ADD ./entrypoint.sh /io.buoyant/entrypoint.sh

ENTRYPOINT [ "/io.buoyant/entrypoint.sh" ]
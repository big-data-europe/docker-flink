FROM bde2020/flink-base:1.14.5-hadoop3.2

LABEL MAINTAINER="Gezim Sejdiu <g.sejdiu@gmail.com>"

ADD worker.sh /

EXPOSE 8081

CMD ["/bin/bash", "/worker.sh"]

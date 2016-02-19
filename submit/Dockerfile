FROM bde2020/flink-base:0.10.1-hadoop2.7

MAINTAINER Gezim Sejdiu <g.sejdiu@gmail.com>

ENV FLINK_APPLICATION_JAR_NAME application-1.0
ENV FLINK_APPLICATION_JAR_LOCATION usr/src/app/${FLINK_APPLICATION_JAR_NAME}.jar
ENV FLINK_APPLICATION_ARGS ""

RUN mkdir -p /app \
    && mkdir -p /usr/src/app

ADD target/${FLINK_APPLICATION_JAR_NAME}.jar /usr/src/app/
#${FLINK_APPLICATION_JAR_LOCATION}

ADD submit.sh /

CMD ["/bin/bash", "/submit.sh"]

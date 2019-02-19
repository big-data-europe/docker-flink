FROM bde2020/flink-base:1.7.2-hadoop2.8

MAINTAINER Gezim Sejdiu <g.sejdiu@gmail.com>

ENV FLINK_APPLICATION_JAR_NAME application-1.0
ENV FLINK_APPLICATION_JAR_LOCATION /app/application.jar
ENV FLINK_APPLICATION_MAIN_CLASS my.main.Job
ENV FLINK_APPLICATION_ARGS ""

ADD submit.sh /

CMD ["/bin/bash", "/submit.sh"]

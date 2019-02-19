FROM bde2020/flink-submit:1.7.2-hadoop2.8

MAINTAINER Gezim Sejdiu <g.sejdiu@gmail.com>

ENV FLINK_APPLICATION_JAR_NAME application-1.0

COPY template.sh /

RUN apt-get update \
      && apt-get install -y maven \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/* \
      && chmod +x /template.sh \
      && update-java-alternatives -s java-1.8.0-openjdk-amd64 \
      && mkdir -p /app \
      && mkdir -p /usr/src/app

ONBUILD COPY . /usr/src/app
ONBUILD RUN cd /usr/src/app \
      && mvn clean package

CMD ["/bin/bash", "/template.sh"]

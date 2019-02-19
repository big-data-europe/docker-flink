FROM bde2020/flink-submit:1.7.2-hadoop2.8

MAINTAINER Gezim Sejdiu <g.sejdiu@gmail.com>

ENV FLINK_APPLICATION_JAR_NAME application-1.0

# SBT & Scala
ENV SCALA_VERSION=2.11.8
ENV SBT_VERSION=0.13.12


COPY template.sh /

RUN apt-get update \
      && curl -fsL http://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz | tar xfz - -C / \
      && echo >> /.bashrc \
      && echo 'export PATH=~/scala-$SCALA_VERSION/bin:$PATH' >> /.bashrc \
      && curl -L -o sbt-$SBT_VERSION.deb http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb \
      && dpkg -i sbt-$SBT_VERSION.deb \
      && rm sbt-$SBT_VERSION.deb \
      && apt-get update \
      && apt-get install sbt \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/* \
      && chmod +x /template.sh \
      && update-java-alternatives -s java-1.8.0-openjdk-amd64 \
      && mkdir -p /app \
      && mkdir -p /usr/src/app

ONBUILD COPY . /usr/src/app
ONBUILD RUN cd /usr/src/app \
#        && sbt clean package
         && sbt clean assembly

CMD ["/bin/bash", "/template.sh"]

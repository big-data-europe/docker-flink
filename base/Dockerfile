FROM bde2020/hadoop-base:2.0.0-hadoop3.2.1-java8

LABEL MAINTAINER="Gezim Sejdiu <g.sejdiu@gmail.com>"

ENV FLINK_VERSION=1.14.5
ENV HADOOP_VERSION=32
ENV SCALA_VERSION=2.12

#Enable poc-init-daemon
ENV ENABLE_INIT_DAEMON false
ENV INIT_DAEMON_BASE_URI http://identifier/init-daemon
ENV INIT_DAEMON_STEP flink_master_init

COPY wait-for-step.sh /
COPY execute-step.sh /
COPY finish-step.sh /

##Flink Installation
###Download:
RUN   apt-get update \
      && apt-get install dnsutils -y  \
      && apt-get -y install openssh-client \
      && chmod +x *.sh \
      && curl -fSL https://archive.apache.org/dist/flink/flink-${FLINK_VERSION}/flink-${FLINK_VERSION}-bin-scala_${SCALA_VERSION}.tgz -o flink-${FLINK_VERSION}-bin-scala_${SCALA_VERSION}.tgz\
      && tar -xvzf flink-${FLINK_VERSION}-bin-scala_${SCALA_VERSION}.tgz \
      && rm flink-${FLINK_VERSION}-bin-scala_${SCALA_VERSION}.tgz \
      && mv flink-${FLINK_VERSION} /usr/local/flink

ENV FLINK_HOME /usr/local/flink
ENV PATH $PATH:$FLINK_HOME/bin

#add passless key to ssh
RUN ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/*

# add netcat for SERVICE_PRECONDITION checks
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends netcat

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

FROM java:8

MAINTAINER Gezim Sejdiu <g.sejdiu@gmail.com>

#add passless key to ssh
RUN ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/*

ENV FLINK_VERSION=1.7.2
ENV HADOOP_VERSION=28
ENV SCALA_VERSION=2.11

#Enable poc-init-daemon
ENV ENABLE_INIT_DAEMON true
ENV INIT_DAEMON_BASE_URI http://identifier/init-daemon
ENV INIT_DAEMON_STEP flink_master_init

COPY wait-for-step.sh /
COPY execute-step.sh /
COPY finish-step.sh /

##Flink Installation
###Download:
RUN   apt-get update \
      && apt-get install dnsutils -y  \
      && chmod +x *.sh \
      && wget https://archive.apache.org/dist/flink/flink-${FLINK_VERSION}/flink-${FLINK_VERSION}-bin-hadoop${HADOOP_VERSION}-scala_${SCALA_VERSION}.tgz \
      && tar -xvzf flink-${FLINK_VERSION}-bin-hadoop${HADOOP_VERSION}-scala_${SCALA_VERSION}.tgz \
      && rm flink-${FLINK_VERSION}-bin-hadoop${HADOOP_VERSION}-scala_${SCALA_VERSION}.tgz \
      && mv flink-${FLINK_VERSION} /usr/local/flink

ENV FLINK_HOME /usr/local/flink
ENV PATH $PATH:$FLINK_HOME/bin

#config files (template)
#ADD flink-conf.yaml /usr/local/flink/conf/
#ADD masters /usr/local/flink/conf/
#ADD slaves /usr/local/flink/conf/

# add netcat for SERVICE_PRECONDITION checks
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends netcat

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

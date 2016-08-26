FROM java:8

MAINTAINER Gezim Sejdiu <g.sejdiu@gmail.com>

#add passless key to ssh
RUN ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/*

#Enable poc-init-daemon
ENV ENABLE_INIT_DAEMON true
ENV INIT_DAEMON_BASE_URI http://identifier/init-daemon
ENV INIT_DAEMON_STEP flink_master_init

COPY wait-for-step.sh /
COPY execute-step.sh /
COPY finish-step.sh /

##Flink 0.10.1 Installation
###Download:

RUN apt-get update \
      && wget http://mirror.switch.ch/mirror/apache/dist/flink/flink-0.10.1/flink-0.10.1-bin-hadoop27-scala_2.11.tgz \
      && tar -xvzf flink-0.10.1-bin-hadoop27-scala_2.11.tgz \
      && mv flink-0.10.1 /usr/local/flink 

ENV FLINK_HOME /usr/local/flink
ENV PATH $PATH:$FLINK_HOME/bin

#config files (template)
ADD flink-conf.yaml /usr/local/flink/conf/
#ADD masters /usr/local/flink/conf/
#ADD slaves /usr/local/flink/conf/


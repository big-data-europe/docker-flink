FROM bde2020/flink-base:0.10.1-hadoop2.7

MAINTAINER Gezim Sejdiu <g.sejdiu@gmail.com>

#config files (template)
#ADD /usr/local/flink/conf/flink-conf.yaml /usr/local/flink/conf/

ADD master.sh /
#RUN chmod +x /usr/local/flink/bin/jobmanager.sh


EXPOSE 6123 22 8080

CMD ["/bin/bash", "/master.sh"]

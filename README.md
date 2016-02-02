# Flink docker

Apache Flink docker images to:
* Setup a standalone [Apache Flink](http://flink.apache.org/) cluster running one Flink Master and multiple Flink workers
* Build Flink applications in Scala, Java or Python to run on a Flink cluster

Currently supported versions:
* Flink 0.10.1 for Hadoop 2.7

## Flink Master
To start a FLink master:

    docker run --name flink-master -h flink-master -d bde2020/flink-master:0.10.1-hadoop2.7

## Flink Worker
To start a Flink worker:

    docker run --name flink-worker --link flink-master:flink-master -d bde2020/flink-worker:0.10.1-hadoop2.7

## Launch a Flink application
Building and running your Flink application on top of the Flink cluster by using docker image flink-submit.

    docker run flink-submit
  			${FLINK_APPLICATION_JAR_LOCATION} \
  			${FLINK_APPLICATION_ARGS}

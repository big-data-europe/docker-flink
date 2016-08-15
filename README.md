# Flink docker

Apache Flink docker images to:
* Setup a standalone [Apache Flink](http://flink.apache.org/) cluster running one Flink Master and multiple Flink workers
* Build Flink applications in Scala, Java or Python to run on a Flink cluster

Currently supported versions:
* Flink 0.10.1 for Hadoop 2.7

## Using Docker Compose

Add the following services to your `docker-compose.yml` to integrate a Flink master and Flink worker in [your BDE pipeline](https://github.com/big-data-europe/app-bde-pipeline): 
```
flinkmaster:
    image: bde2020/flink-master:0.10.1-hadoop2.7
    environment:
      INIT_DAEMON_STEP: setup_flink
flinkworker:
    image: bde2020/flink-worker:0.10.1-hadoop2.7
    links:
        - "flinkmaster:flink-master"

```

## Running Docker containers without the init daemon
## Flink Master
To start a Flink master:

    docker run --name flink-master -h flink-master -e ENABLE_INIT_DAEMON=false -d bde2020/flink-master:0.10.1-hadoop2.7

## Flink Worker
To start a Flink worker:

    docker run --name flink-worker --link flink-master:flink-master -e ENABLE_INIT_DAEMON=false -d bde2020/flink-worker:0.10.1-hadoop2.7

## Launch a Flink application
Building and running your Flink application on top of the Flink cluster is as simple as extending a template Docker image. Check the template's README for further documentation.
* [Maven template](https://github.com/big-data-europe/docker-flink/tree/master/template/maven)
* Sbt template (will be added soon)


## TODOs
* Scale the cluster up or down to *N* TaskManagers
  `docker-compose scale taskmanager=<N>`

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
    ports:
        - "48080:8080"
        - "220:22"
    environment:
      INIT_DAEMON_STEP: setup_flink
    expose:
        - "6123"
        - "22"
flinkworker:
    image: bde2020/flink-worker:0.10.1-hadoop2.7
    ports:
        - "22"
        - "48081:8081"
    expose:
        - "6121"
        - "6122"
    links:
        - "flinkmaster:flink-master"

```

## Running Docker containers without the init daemon
## Flink Master
To start a FLink master:

    docker run --name flink-master -h flink-master -e ENABLE_INIT_DAEMON=false -d bde2020/flink-master:0.10.1-hadoop2.7

## Flink Worker
To start a Flink worker:

    docker run --name flink-worker --link flink-master:flink-master -e ENABLE_INIT_DAEMON=false -d bde2020/flink-worker:0.10.1-hadoop2.7

## Launch a Flink application
Building and running your Flink application on top of the Flink cluster by using docker image flink-submit.
#### Steps to extend the flink-submit image

1. Modify a Dockerfile in the flink-submit folder
2. Configure the following environment variables:
  * `FLINK_APPLICATION_JAR_NAME` (default: application-1.0)
  * `FLINK_APPLICATION_ARGS` (default: "")
4. Build and run the image
```
docker build --rm=true -t bde2020/flink-submit:0.10.1-hadoop2.7 .
docker run --name flink-demo-app --link flink-master:flink-master -d bde2020/flink-submit:0.10.1-hadoop2.7
```

The sources in the project folder will be automatically added to `/usr/src/app` if you directly extend the flink-submit image.

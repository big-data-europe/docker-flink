# Flink SBT template

The Flink SBT template image serves as a base image to build your own SBT application to run on a Flink cluster. See [big-data-europe/docker-flink README](https://github.com/big-data-europe/docker-flink) for a description how to setup a Flink cluster.

### Package your application using SBT
You can build and launch your application on a Flink cluster by extending this image with your sources. The template uses [SBT](http://www.scala-sbt.org/) as build tool, so make sure you have a `build.sbt` file for your application specifying all the dependencies.

The SBT `assembly` command must create an assembly JAR (or 'uber' JAR) containing your code and its dependencies. Flink and Hadoop dependencies should be listes as `provided`.

### Extending the Flink SBT template with your application

#### Steps to extend the Flink Maven template
1. Create a Dockerfile in the root folder of your project (which also contains a `build.sbt`)
2. Extend the Flink SBT template Docker image
3. Configure the following environment variables (unless the default value satisfies):
  * `FLINK_APPLICATION_JAR_NAME` (default: application-1.0)
  * `FLINK_APPLICATION_MAIN_CLASS` (default: my.main.Job)
  * `FLINK_APPLICATION_ARGS` (default: "")
4. Build and run the image
```
docker build --rm=true -t bde/flink-app .
docker run --name my-flink-app --link flink-master:flink-master -d bde/flink-app
```

The sources in the project folder will be automatically added to `/usr/src/app` if you directly extend the Flink SBT template image. Otherwise you will have to add and package the sources by yourself in your Dockerfile with the commands:

    COPY . /usr/src/app
    RUN cd /usr/src/app \
        && sbt clean assembly

      
If you overwrite the template's `CMD` in your Dockerfile, make sure to execute the `/template.sh` script at the end.

#### Example Dockerfile
```
FROM bde2020/flink-sbt-template:1.7.2-hadoop2.8

MAINTAINER Gezim Sejdiu <g.sejdiu@gmail.com>

ENV FLINK_APPLICATION_JAR_NAME my-app-1.0-SNAPSHOT-with-dependencies
ENV FLINK_APPLICATION_MAIN_CLASS my.main.Job
ENV FLINK_APPLICATION_ARGS "arg1 arg2"
```

#### Example application
See [flink-starter](https://github.com/gezims/flink-starter).


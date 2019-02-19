# Flink Maven template

The Flink Maven template image serves as a base image to build your own Maven application to run on a Flink cluster. See [big-data-europe/docker-flink README](https://github.com/big-data-europe/docker-flink) for a description how to setup a Flink cluster.

### Package your application using Maven
You can build and launch your application on a Flink cluster by extending this image with your sources. The template uses [Maven](https://maven.apache.org/) as build tool, so make sure you have a `pom.xml` file for your application specifying all the dependencies.

The Maven `package` command must create an assembly JAR (or 'uber' JAR) containing your code and its dependencies. Flink and Hadoop dependencies should be listes as `provided`. The [Maven shade plugin](http://maven.apache.org/plugins/maven-shade-plugin/) provides a plugin to build such assembly JARs.

### Extending the Flink Maven template with your application

#### Steps to extend the Flink Maven template
1. Create a Dockerfile in the root folder of your project (which also contains a `pom.xml`)
2. Extend the Flink Maven template Docker image
3. Configure the following environment variables (unless the default value satisfies):
  * `FLINK_APPLICATION_JAR_NAME` (default: application-1.0)
  * `FLINK_APPLICATION_MAIN_CLASS` (default: my.main.Job)
  * `FLINK_APPLICATION_ARGS` (default: "")
4. Build and run the image
```
docker build --rm=true -t bde/flink-app .
docker run --name my-flink-app --link flink-master:flink-master -d bde/flink-app
```

The sources in the project folder will be automatically added to `/usr/src/app` if you directly extend the Flink Maven template image. Otherwise you will have to add and package the sources by yourself in your Dockerfile with the commands:

    COPY . /usr/src/app
    RUN cd /usr/src/app \
        && mvn clean package
      
If you overwrite the template's `CMD` in your Dockerfile, make sure to execute the `/template.sh` script at the end.

#### Example Dockerfile
```
FROM bde2020/flink-maven-template:1.7.2-hadoop2.8

MAINTAINER Gezim Sejdiu <g.sejdiu@gmail.com>

ENV FLINK_APPLICATION_JAR_NAME my-app-1.0-SNAPSHOT-with-dependencies
ENV FLINK_APPLICATION_MAIN_CLASS my.main.Job
ENV FLINK_APPLICATION_ARGS "arg1 arg2"
```

#### Example application
See [flink-starter](https://github.com/gezims/flink-starter).


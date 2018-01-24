# Flink base
The Flink base image serves as a base image for the Flink master, Flink worker and Flink submit images. The user should not run this image directly. 
See [big-data-europe/docker-flink README](https://github.com/big-data-europe/docker-flink) for more information.

# build the image

    docker build -t bde2020/flink-base:1.4.0-hadoop2.7 .

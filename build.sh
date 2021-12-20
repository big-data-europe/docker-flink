#!/bin/bash

set -e

TAG=1.14.2-hadoop3.2

build() {
    NAME=$1
    IMAGE=bde2020/flink-$NAME:$TAG
    cd $([ -z "$2" ] && echo "./$NAME" || echo "$2")
    echo '--------------------------' building $IMAGE in $(pwd)
    docker build -t $IMAGE .
    cd -
}

build base
build master
build worker
build submit
build maven-template template/maven
build sbt-template template/sbt

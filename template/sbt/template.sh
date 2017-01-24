#!/bin/bash

cd /usr/src/app
cp target/${FLINK_APPLICATION_JAR_NAME}.jar ${FLINK_APPLICATION_JAR_LOCATION}

sh /submit.sh

/wait-for-step.sh

/execute-step.sh
/usr/local/flink/bin/flink run \
    ${FLINK_APPLICATION_JAR_LOCATION} ${FLINK_APPLICATION_ARGS}
/finish-step.sh

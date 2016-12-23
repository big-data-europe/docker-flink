/wait-for-step.sh

echo "Submit application ${FLINK_APPLICATION_JAR_LOCATION} with main class ${FLINK_APPLICATION_MAIN_CLASS} to Flink master"
echo "Passing arguments ${FLINK_APPLICATION_ARGS}"

/execute-step.sh
/usr/local/flink/bin/flink run -c ${FLINK_APPLICATION_MAIN_CLASS} -m $FLINK_MASTER_PORT_6123_TCP_ADDR:$FLINK_MASTER_PORT_6123_TCP_PORT \
    ${FLINK_APPLICATION_JAR_LOCATION} ${FLINK_APPLICATION_ARGS}
/finish-step.sh

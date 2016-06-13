/wait-for-step.sh

echo "Submit application ${FLINK_APPLICATION_JAR_LOCATION}"
echo "Passing arguments ${FLINK_APPLICATION_ARGS}"

/execute-step.sh
/usr/local/flink/bin/flink run \
    ${FLINK_APPLICATION_JAR_LOCATION} ${FLINK_APPLICATION_ARGS}
/finish-step.sh

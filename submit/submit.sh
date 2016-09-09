/wait-for-step.sh

echo "Submit application ${FLINK_APPLICATION_JAR_LOCATION}"
echo "Passing arguments ${FLINK_APPLICATION_ARGS}"

/execute-step.sh
<<<<<<< HEAD

=======
>>>>>>> 0.10.2-hadoop2.7
/usr/local/flink/bin/flink run -m $FLINK_MASTER_PORT_6123_TCP_ADDR:$FLINK_MASTER_PORT_6123_TCP_PORT \
    ${FLINK_APPLICATION_JAR_LOCATION} ${FLINK_APPLICATION_ARGS}
/finish-step.sh

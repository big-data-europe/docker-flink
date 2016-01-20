# Start the web client
/usr/local/flink/bin/start-webclient.sh

# Start the flink cluster
# jobmanager.sh start cluster
/usr/local/flink/bin/jobmanager.sh start cluster

#sleep infinity


tail -f /usr/local/flink/log/flink--jobmanager-flink.log

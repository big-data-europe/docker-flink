# Start the web client
/usr/local/flink/bin/start-webclient.sh

# Start the flink cluster
# jobmanager.sh start cluster
/usr/local/flink/bin/jobmanager.sh start cluster #local #cluster
echo "Cluster started."
#sleep infinity


#tail -f /usr/local/flink/log/flink--jobmanager-flink.log
tail -f `find /usr/local/flink/log/ -name *jobmanager*.out`


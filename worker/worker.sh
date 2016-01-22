# Start the flink task manager (slave)
/usr/local/flink/bin/taskmanager.sh start

#sleep infinity

#tail -f /usr/local/flink/log/flink--taskmanager-flink.log
tail -f `find /usr/local/flink/log/ -name *taskmanager*.out`

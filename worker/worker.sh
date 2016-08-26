# Start the flink task manager (slave)
echo "Configuring Task Manager on this node"
sed -i -e "s/%jobmanager%/$FLINK_MASTER_PORT_6123_TCP_ADDR/g" /usr/local/flink/conf/flink-conf.yaml

echo "Starting Task Manager"
/usr/local/flink/bin/taskmanager.sh start

echo "Config file: " && grep '^[^\n#]' /usr/local/flink/conf/flink-conf.yaml
echo "Sleeping 10 seconds, then start to tail the log file"
sleep 10 && tail -f `ls /usr/local/flink/log/*.log | head -n1`

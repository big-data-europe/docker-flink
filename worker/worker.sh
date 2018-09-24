# Start the flink task manager (slave)
echo "Configuring Task Manager on this node"
FLINK_NUM_TASK_SLOTS=${FLINK_NUM_TASK_SLOTS:-`grep -c ^processor /proc/cpuinfo`}
FLINK_MASTER_PORT_6123_TCP_ADDR=`host ${FLINK_MASTER_PORT_6123_TCP_ADDR} | grep "has address" | awk '{print $4}'`

#sed -i -e "s/%jobmanager%/$FLINK_MASTER_PORT_6123_TCP_ADDR/g" /usr/local/flink/conf/flink-conf.yaml
sed -i -e "s/jobmanager.rpc.address: localhost/jobmanager.rpc.address: ${FLINK_MASTER_PORT_6123_TCP_ADDR}/g" /usr/local/flink/conf/flink-conf.yaml
sed -i -e "s/taskmanager.numberOfTaskSlots: 1/taskmanager.numberOfTaskSlots: ${FLINK_NUM_TASK_SLOTS}/g" /usr/local/flink/conf/flink-conf.yaml
echo "blob.server.port: 6124" >> /usr/local/flink/conf/flink-conf.yaml
echo "query.server.port: 6125" >> /usr/local/flink/conf/flink-conf.yaml

echo "Starting Task Manager"
/usr/local/flink/bin/taskmanager.sh start

echo "Config file: " && grep '^[^\n#]' /usr/local/flink/conf/flink-conf.yaml
echo "Sleeping 10 seconds, then start to tail the log file"
sleep 10 && tail -f `ls /usr/local/flink/log/*.log | head -n1`

#!/bin/bash
# Start the flink cluster
# jobmanager.sh start cluster
function wait_for_it()
{
    local serviceport=$1
    local service=${serviceport%%:*}
    local port=${serviceport#*:}
    local retry_seconds=5
    local max_try=100
    let i=1

    nc -z $service $port
    result=$?

    until [ $result -eq 0 ]; do
      echo "[$i/$max_try] check for ${service}:${port}..."
      echo "[$i/$max_try] ${service}:${port} is not available yet"
      if (( $i == $max_try )); then
        echo "[$i/$max_try] ${service}:${port} is still not available; giving up after ${max_try} tries. :/"
        exit 1
      fi

      echo "[$i/$max_try] try in ${retry_seconds}s once again ..."
      let "i++"
      sleep $retry_seconds

      nc -z $service $port
      result=$?
    done
    echo "[$i/$max_try] $service:${port} is available."
}

if [ ! -z "${SERVICE_PRECONDITION}" ]; then
for i in "${SERVICE_PRECONDITION[@]}"
do
    wait_for_it ${i}
done
fi

echo "Configuring Job Manager on this node"
#sed -i -e "s/%jobmanager%/`hostname -i`/g" /usr/local/flink/conf/flink-conf.yaml
sed -i -e "s/jobmanager.rpc.address: localhost/jobmanager.rpc.address: `hostname -i`/g" /usr/local/flink/conf/flink-conf.yaml
/usr/local/flink/bin/jobmanager.sh start cluster #local #cluster
echo "Cluster started."
#sleep infinity
# Start the web client -- for newest version 1.x  of Flink is integrated on Flink Dashboard
#/usr/local/flink/bin/start-webclient.sh

#mkdir -p $FLINK_MASTER_LOG

echo "Config file: " && grep '^[^\n#]' /usr/local/flink/conf/flink-conf.yaml
echo "Sleeping 10 seconds, then start to tail the log file"
sleep 10 && tail -f `ls /usr/local/flink/log/*.log | head -n1`

#tail -f /usr/local/flink/log/flink--jobmanager-flink.log
#tail -f `find /usr/local/flink/log/ -name *jobmanager*.out`

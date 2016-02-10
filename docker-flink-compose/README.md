#Apache Flink cluster deployment on Docker using Docker-Compose

##Installation
###Install Docker-Compose

```
curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose
```

###Deploy

- Deploy cluster

`docker-compose up`

- Deploy as a daemon (and return)

`docker-compose up -d`

- Kill the cluster

`docker-compose kill`

- Upload a jar to the cluster

`scp -P 220 <your_jar> root@localhost:/<your_path>`

- Run a topology

`ssh -p 220 root@localhost /usr/local/flink/bin/flink run -c <your_class> <your_jar> <your_params>`

or

ssh to the job manager and run the topology from there.

###Ports

- The Web Dashboard is on port `48080`
- The Web Client is on port `48081`

Edit the `docker-compose.yml` file to edit port settings.

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

- Run a Flink Application

See [big-data-europe/docker-flink README](https://github.com/big-data-europe/docker-flink) for a description how to lunch a flink application on docker flink images.

###Ports

- The Web Dashboard is on port `48080`
- The Web Client is on port `48081`


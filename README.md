# activemq-mqtt-example
Yet another ActiveMQ / MQTT example, combining with InfluxDB / Telegraf and Grafana for visualization and alerting.

## Configuring ActiveMQ
The `modules/broker/src/main/docker/conf` folder contains useful configuration files.
The `modules/broker/src/main/docker/conf/activemq.xml` contains activation for the MQTT connector and some startup topics and queues.

## Starting up ActiveMQ
Run
```
cd modules/broker
./start.sh
```
ActiveMQ should start up and dump its activity to the standard output. You can kill it with Ctrl+C.

## Subscribing to ActiveMQ via MQTT
You can use a debug MQTT client like so :
```
docker run -it --rm --net=host efrecon/mqtt-client sub -h localhost -t "SENSORS/#" -v
```

## Publishing to ActiveMQ via MQTT
You can use a debug MQTT client to publish data like so :
```
docker run -it --rm --net=host efrecon/mqtt-client pub -h localhost -t "SENSORS/ONE/VALUES" -d
```

## Inspecting ActiveMQ activity
Startup the hawt.io console and via your web browser, connect to :
* scheme : http
* host : localhost
* port : 8161
* path : /api/jolokia


## Setting up the Raspberry Pi

* Install docker Community edition : https://docs.docker.com/install/linux/docker-ce/debian/#install-docker-compose-for-raspbian
* Install git : `sudo apt install -y git`
* Pull a few images :
  * docker pull woahbase/alpine-activemq:armhf
  * docker pull woahbase/alpine-grafana:armhf
  * docker pull woahbase/alpine-influxdb:armhf

* Startup ActiveMQ (with MQTT enabled on port 1883)

* Startup InfluxDB to collect data
```
docker run -d --restart=always \
  --name influxdb --hostname medtech-boxe-pi \
  -e PGID=1000 -e PUID=1000 \
  -p 8086:8086 -p 8088:8088 -p 4242:4242 \
  -v data:/var/lib/influxdb \
  -v /etc/hosts:/etc/hosts:ro \
  -v /etc/localtime:/etc/localtime:ro \
  woahbase/alpine-influxdb:armhf
```
* Startup Telegraf to collect data
```
docker run -v $PWD/modules/telegraf/telegraf.conf:/etc/telegraf/telegraf.conf:ro telegraf
```

* Startup Grafana to inspect the data
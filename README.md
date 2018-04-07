# activemq-mqtt-example
Yet another ActiveMQ / MQTT example, using the Webcenter docker

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

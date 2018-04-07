# -v `pwd`/src/main/docker/conf:/opt/activemq/conf
docker run -it --rm --name=activemq -p 1883:1883 -p 61616:61616 -p 8161:8161  webcenter/activemq
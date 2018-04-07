docker run -it --rm -v `pwd`/src/main/docker/conf/activemq.xml:/opt/activemq/conf/activemq.xml:z --name=activemq -p 1883:1883 -p 61616:61616 -p 8161:8161  webcenter/activemq

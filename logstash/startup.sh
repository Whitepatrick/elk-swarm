#!/bin/bash

sudo docker build -t logstash-sb . \

<<<<<<< HEAD
sudo docker run -d --rm \
=======
sudo docker run -d \
>>>>>>> master
  -v "$PWD"/config:/config \
  --net=host \
  --name logstash-sb \
  logstash-sb \
  logstash -f /config/logstash-*.conf

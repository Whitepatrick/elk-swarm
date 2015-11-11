#!/bin/bash

sudo docker build -t logstash-fwdr-sb .

sudo docker run -d \
  --net=host \
  -v "$PWD"/config:/opt/conf \
  --name logstash-fwdr-sb \
  logstash-fwdr-sb

#!/bin/bash

<<<<<<< HEAD
sudo docker build -t elastic-sb . \
=======
#sudo docker build -t elastic-sb . \
>>>>>>> master

sudo docker run -d \
  -v "$PWD/config":/usr/share/elasticsearch/data \
  -v "$PWD/esdata":/usr/share/elasticsearch/esdata \
  --name elastic-sb \
  --net=host \
  elastic-sb

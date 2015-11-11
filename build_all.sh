#!/bin/bash

sudo docker build -t elastic-sb elasticsearch/.
sudo docker build -t logstash-fwdr-sb logstash-forwarder/.
sudo docker build -t logstash-sb logstash/.
sudo docker build -t kibana-sb kibana/.

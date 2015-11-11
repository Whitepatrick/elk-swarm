sudo docker-machine create -d virtualbox elk
eval ''
eval 'dollarparensudo docker-machine env elk)'
sudo docker run swarm create
docker-machine create -d virtualbox --swarm --swarm-master --swarm-discovery token://2f80a8de0fed15b7c361d706dd0860fd swarm-master
docker-machine create -d virtualbox --swarm --swarm-discovery token://2f80a8de0fed15b7c361d706dd0860fd elastic-sb

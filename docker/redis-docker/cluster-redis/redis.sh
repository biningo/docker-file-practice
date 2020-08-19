#!/bin/bash


REDIS_HOME="/usr/local/redis"

for index in {1..6};
do
mkdir -p  $PWD/node-${index}/conf
mkdir -p  $PWD/node-${index}/data
touch   $PWD/node-${index}/conf/redis.conf
cat << EOF > node-${index}/conf/redis.conf
port 6379
bind 0.0.0.0
cluster-enabled yes
cluster-config-file nodes.conf
cluster-node-timeout 5000
cluster-announce-ip 172.0.0.$((${index}+1))
cluster-announce-port 6379
cluster-announce-bus-port 16379
appendonly yes
dir $REDIS_HOME/data
EOF
done

docker-compose up -d && docker exec redis-node-1 bash -c "echo yes | redis-cli --cluster create 172.0.0.{2..7}:6379 --cluster-replicas 1"





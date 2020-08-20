#!/bin/bash
REDIS_HOME="/usr/local/redis"
docker run -d --name redis \
  -v $PWD/redis.conf:$REDIS_HOME/etc/redis.conf \
  -v $PWD/data:$REDIS_HOME/data \
  -w $REDIS_HOME \
  -p 6379:6379 \
  redis  $REDIS_HOME/etc/redis.conf

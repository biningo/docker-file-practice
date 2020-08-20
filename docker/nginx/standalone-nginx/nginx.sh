#!/bin/bash
docker run --name nginx \
  -v $PWD/conf.d:/etc/nginx/conf.d \
  -v $PWD/nginx.conf:/etc/nginx/nginx.conf \
  -w /etc/nginx \
  -d -p 8000:80  nginx

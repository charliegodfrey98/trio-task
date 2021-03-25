#!/bin/bash

# create network
docker network create trio-task-network

# build images
docker build -t trio-db db
docker build -t trio-flask-app flask-app

# run database container

docker run -d  \
    --network trio-task-network \
    --name mysql \
    trio-db


# run flask app

docker run -d \
    --network trio-task-network \
     --name flask-app \
     trio-flask-app

#run the nginx container

docker run -d \
--network trio-task-network \
 --mount type=bind,source=$(pwd)/nginx/nginx.conf,target=/etc/nginx/nginx.conf \
  -p 80:80 \
   --name nginx \
    nginx:alpine

    docker ps -a

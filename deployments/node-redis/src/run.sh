#!/bin/bash
set -e


docker build -t jdeskins/node-demo:1.0 .

docker run -d --name redis-master -p 6379:6379 redis:2.8.23 redis-server --appendonly yes
docker run -d --name redis-slave -p 6380:6379 --link redis-master:redis-master \
    redis:2.8.23 redis-server --slaveof redis-master 6379 --slave-read-only no --appendonly yes

docker run -d --name web -p 8080:8080 --link redis-master:redis-master --link redis-slave:redis-slave \
    jdeskins/node-demo:1.0

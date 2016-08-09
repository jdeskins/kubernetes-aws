#!/bin/bash


docker stop web redis-slave redis-master
docker rm web redis-slave redis-master

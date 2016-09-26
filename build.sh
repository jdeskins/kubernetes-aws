#!/bin/bash

VERSION=v1.4.0

docker build -t jdeskins/kubernetes-aws:${VERSION} .

docker tag jdeskins/kubernetes-aws:${VERSION} jdeskins/kubernetes-aws:latest

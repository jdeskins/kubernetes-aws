#!/bin/bash

VERSION=1.5.2

docker build -t jdeskins/kubernetes-aws:${VERSION} .

docker tag jdeskins/kubernetes-aws:${VERSION} jdeskins/kubernetes-aws:latest

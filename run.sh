#!/bin/bash

# env-file is always processed first no matter the order
docker run -it --env-file ./env.list -e USER -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_DEFAULT_REGION \
    -p 8001:8001 \
    -v $(PWD)/kubeconfig:/root/.kube/ \
    jdeskins/kubernetes-aws

#!/bin/bash

# env-file is always processed first no matter the order
docker run -it --env-file ./env.list -e USER -e AWS_DEFAULT_PROFILE -e AWS_DEFAULT_REGION \
    -p 8001:8001 \
    -v $(PWD)/kubeconfig:/root/.kube/ \
    -v $(PWD)/deployments:/project/deployments \
    -v ~/.aws:/root/.aws \
    jdeskins/kubernetes-aws

#!/bin/bash

# env-file is always processed first no matter the order
docker run -it --env-file ./env.list -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_DEFAULT_REGION jdeskins/kubernetes-aws

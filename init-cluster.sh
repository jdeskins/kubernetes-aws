#!/bin/bash

curl -sS https://get.k8s.io | MULTIZONE=1 KUBERNETES_PROVIDER=aws

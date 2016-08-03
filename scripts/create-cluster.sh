#!/bin/bash

curl -sS https://get.k8s.io | MULTIZONE=true KUBERNETES_PROVIDER=aws bash

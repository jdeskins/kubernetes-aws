FROM python:3.5-alpine

RUN apk add --update bash curl && \
  rm -rf /var/cache/apk/*

# RUN apt-get update && apt-get install -y \
#     curl \
#     wget && \
#     rm -rf /var/lib/apt/lists/*

# Install AWS command line tool
RUN pip install --upgrade pip && pip install awscli

# Install Kubernetes
RUN curl -SLO https://github.com/kubernetes/kubernetes/releases/download/v1.2.0/kubernetes.tar.gz && \
  tar xzvf kubernetes.tar.gz && \
  rm kubernetes.tar.gz

ENV PATH /kubernetes/cluster:$PATH
ENV PATH /kubernetes/platforms/linux/amd64:$PATH

RUN mkdir /project
ADD init-cluster.sh /project
WORKDIR /project

CMD "/bin/bash"

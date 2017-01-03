FROM ubuntu:15.10

RUN apt-get update && apt-get install -y \
    curl \
    git \
    groff \
    openssh-server \
    python3 \
    python3-pip \
    wget \
    vim && \
    rm -rf /var/lib/apt/lists/*

# make some useful symlinks that are expected to exist
RUN cd /usr/bin && ln -s python3 python

RUN pip3 install awscli

RUN mkdir /project
WORKDIR /project

# Install Kubernetes
RUN curl -SLO https://github.com/kubernetes/kubernetes/releases/download/v1.5.1/kubernetes.tar.gz && \
  tar xzvf kubernetes.tar.gz && \
  rm kubernetes.tar.gz

ADD scripts /project/scripts

ENV PATH /project/scripts:$PATH
ENV PATH /project/kubernetes/cluster:$PATH
ENV PATH /project/kubernetes/platforms/linux/amd64:$PATH


EXPOSE 8001

CMD "/bin/bash"

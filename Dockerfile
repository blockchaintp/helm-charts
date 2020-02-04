FROM ubuntu:bionic

RUN apt-get update -y && \
  apt-get install -yq \
  apt-transport-https \
  apt-utils \
  build-essential \
  ca-certificates \
  curl \
  gpg \
  make \
  python3-pip \
  software-properties-common

#Install kubectl
ARG KUBECTL_VERSION=v1.16.3
RUN mkdir -p /usr/local/bin && \
  curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
  chmod +x kubectl && \
  mv kubectl /usr/local/bin

#Install Latest eksctl
ARG EKSCTL_VERSION=0.13.0
RUN curl --silent --location \
  "https://github.com/weaveworks/eksctl/releases/download/${EKSCTL_VERSION}/eksctl_Linux_amd64.tar.gz" | \
  tar xz -C /tmp && \
  chmod +x /tmp/eksctl && \
  mv /tmp/eksctl /usr/local/bin

#Install Helm
ARG HELM_VERSION=v3.0.0
RUN mkdir -p /app/api/tmp && \
  curl -sSL https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -o /app/api/tmp/helm.tar.gz && \
  cd /app/api/tmp && \
  tar zxvf helm.tar.gz && \
  cp linux-amd64/helm /usr/local/bin && \
  rm -rf /app/api/tmp && \
  chmod +x /usr/local/bin/helm

#Install Latest AWS CLI
RUN pip3 install awscli --upgrade

#Cleanup
RUN apt-get autoremove -yq
ENV PATH=$PATH:/usr/local/bin

ENTRYPOINT ["/bin/bash"]

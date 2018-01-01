#!/bin/bash

sudo groupadd docker
sudo usermod -aG docker $(getent passwd 1000 | cut -f1 -d:)

sudo apt-get update

sudo apt-get install -y \
    apt-transport-https \
    build-essential \
    ca-certificates \
    curl \
    git \
    python-pip \
    python-setuptools \
    software-properties-common

pip install --upgrade --user pip setuptools

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

sudo apt-add-repository -y ppa:ansible/ansible

sudo apt-get update

sudo apt-get install -y ansible docker-ce

pip install --user docker

sudo systemctl enable docker
sudo systemctl start docker
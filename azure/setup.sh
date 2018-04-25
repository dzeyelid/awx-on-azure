#!/bin/bash

WORK_USER=$(getent passwd 1000 | cut -f1 -d:)

sudo groupadd docker
sudo usermod -aG docker ${WORK_USER}

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


#pip install --upgrade --user pip setuptools
pip install --upgrade pip==9.0.3
pip install setuptools

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
stable"

sudo apt-add-repository -y ppa:ansible/ansible

sudo apt-get update

sudo apt-get install -y ansible docker-ce

pip install docker-py

sudo systemctl enable docker
sudo systemctl start docker

git clone https://github.com/ansible/awx.git /home/${WORK_USER}/awx
cd /home/${WORK_USER}/awx/installer
ansible-playbook -i inventory install.yml
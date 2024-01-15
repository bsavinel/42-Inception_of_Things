#!/bin/sh

echo ok
su -u root -p vagrant

apt-get install -y curl
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

usermod -aG docker $USER
docker info

curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
k3d version

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install kubectl /usr/local/bin/kubectl
kubectl version --client



k3d cluster create --config config.yml

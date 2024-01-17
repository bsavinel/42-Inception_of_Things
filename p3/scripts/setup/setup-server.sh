#!/bin/sh

# echo ok
# # su -u root -p vagrant

# # sudo apt-get install -y curl
# # curl -fsSL https://get.docker.com -o get-docker.sh
# # sh get-docker.sh

# # sudo usermod -aG docker $USER
# # sudo chmod 666 /var/run/docker.sock
# # docker info

# curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
# k3d version

# curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# sudo chmod 777 /usr/local/bin/ 
# install kubectl /usr/local/bin/kubectl
# kubectl version --client



# k3d cluster create --config /vagrant/scripts/k3d/config.yml


sudo wget https://github.com/rancher/k3d/releases/download/v3.0.0/k3d-linux-amd64 -O /usr/local/bin/k3d
sudo chmod +x /usr/local/bin/k3d
k3d version


wget https://github.com/argoproj/argo-cd/raw/v1.6.2/manifests/install.yaml
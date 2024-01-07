#!/bin/sh
echo B
# curl -LO https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
# chmod +x ./kubectl
# sudo mv ./kubectl /usr/local/bin/kubectl
# # kubectl version --client

# sudo apt-get install ufw
# sudo ufw allow 6443/tcp #apiserver
# sudo ufw allow from 10.42.0.0/16 to any #pods
# sudo ufw allow from 10.43.0.0/16 to any #services
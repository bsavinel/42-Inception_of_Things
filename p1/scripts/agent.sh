#!/bin/sh

sudo apt-get update
sudo apt-get install -y curl net-tools
curl -sfL https://get.k3s.io | sh -s agent --server https://192.168.56.110:6443 --node-ip=192.168.56.111 --token coucou
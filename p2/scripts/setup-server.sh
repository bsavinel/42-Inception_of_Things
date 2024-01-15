#!/bin/sh

sudo apt-get install -y curl
curl -sfL https://get.k3s.io | sh -s server --flannel-iface=eth1 --token coucou --write-kubeconfig-mode 644
kubectl apply -f /vagrant/scripts/kube
#!/bin/sh

curl -sfL https://get.k3s.io | sh -s server --flannel-iface=eth1 --token coucou 
# --write-kubeconfig-mode 644
#!/bin/sh
echo A
# sudo k3s kubectl get nodes -o wide
curl -sfL https://get.k3s.io | sh -s agent --server https://192.168.56.110:6443 --node-ip=192.168.56.111 --token coucou




# curl -sfL https://get.k3s.io | K3S_URL="https://192.168.56.110:6443" sh -s - agent --token coucou --node-ip 192.168.56.111
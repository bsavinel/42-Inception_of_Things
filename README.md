# 42-IoT

This project aims to deepen your knowledge by making you use K3d and K3s with
Vagrant.
You will learn how to set up a personal virtual machine with Vagrant and the
distribution of your choice. Then, you will learn how to use K3s and its Ingress.
Last but not least, you will discover K3d that will simplify your life.


## Usefull commands


### Vagrant
Turn on auto resync on synced folders

	vagrant rsync-auto

### Kubectl
Watch pods on live

	watch -n 1 kubectl get pod


## Aliases script
This script setup usefull aliases

	echo "alias a='alias'
	alias k='kubectl '
	alias ka='kubectl apply -f '
	alias kg='kubectl get '
	alias kgn='kubectl get nodes'
	alias kgnw='kubectl get nodes -o wide'
	alias kgnl='kubectl get nodes --show-labels'
	alias kgp='kubectl get pods'
	alias kgs='kubectl get svc'
	alias kgd='kubectl get deployments'
	alias kcf='kubectl create -f '
	alias kd='kubectl delete '
	alias kdf='kubectl delete -f '
	alias kaf='kubectl apply -f '
	alias kgpa='kubectl get pods --all-namespaces'
	alias wpods='watch -n 1 kubectl get pod'" >> ~/.bashrc


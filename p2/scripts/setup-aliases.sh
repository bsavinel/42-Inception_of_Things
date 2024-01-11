echo "--- setup init"

echo "alias a='alias'
alias k='kubectl '
alias ka='kubectl apply -f '
alias kg='kubectl get '
alias kgn='kubectl get nodes'
alias kgnw='kubectl get nodes -o wide'
alias kgnl='kubectl get nodes --show-labels'
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kgi='kubectl get ingress'
alias kgd='kubectl get deployments'
alias kcf='kubectl create -f '
alias kd='kubectl delete '
alias kdf='kubectl delete -f '
alias kaf='kubectl apply -f '
alias kgpa='kubectl get pods --all-namespaces'
alias wpods='watch -n 1 kubectl get pod'" >> /home/vagrant/.bashrc

echo "--- setup done"

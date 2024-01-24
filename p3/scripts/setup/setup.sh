# create cluster
k3d cluster create p3

# create namespace for argocd
kubectl create namespace argocd
kubectl create namespace dev

# apply base config to cluster
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl wait --for=condition=Running pod --all -n "argocd"

# forward ports between cluster and host
kubectl port-forward svc/argocd-server -n argocd 8080:443 >/dev/null 2>/dev/null &

# print password
echo "Argo Cd admin password : "
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

# create new argo cd app
kubectl apply -f ../project.yml -n argocd

# expose port to host
kubectl wait --for=condition=Running svc --all -n "dev"
kubectl port-forward svc/wil42-playground -n dev 8888:7171 >/dev/null 2>/dev/null &


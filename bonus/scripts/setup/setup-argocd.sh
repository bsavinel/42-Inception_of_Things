. ../utils/wait_for_pods_to_exist.sh --source-only

RED='\e[31m'    # Red text
GREEN='\e[32m'  # Green text
BLUE='\e[34m'   # Blue text
RESET='\e[0m'   # Reset text color to default

kubectl create namespace argocd
kubectl create namespace dev

# apply base config to cluster
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "[\033[3;96mWAITING FOR PODS STARTING...\033[m]"
wait_for_pods_to_exist "argocd" "argocd" 120
kubectl wait --for=condition=Ready pod --all -n "argocd" --timeout=-1s
echo "[\033[3;96mPODS ARE READY!\033[m]"

# forward ports between cluster and host
kubectl port-forward svc/argocd-server -n argocd 8080:443 >/dev/null 2>/dev/null &

# print password
echo "Argo Cd admin password : "
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
echo ""

# create new argo cd app
kubectl apply -f ../project.yml -n argocd

# expose port to host
echo "[\033[3;96mWAITING FOR PODS STARTING...\033[m]"
wait_for_pods_to_exist "dev" "wil42" 120
kubectl wait --for=condition=Ready pod --all -n "dev" --timeout=-1s
echo "[\033[3;96mPODS ARE READY!\033[m]"

kubectl port-forward svc/wil42-playground -n dev 8888:7171 >/dev/null 2>/dev/null &
echo "${GREEN}ArgoCD-UI -> https://localhost:8080"
echo "${GREEN}Application -> http://localhost:8888"


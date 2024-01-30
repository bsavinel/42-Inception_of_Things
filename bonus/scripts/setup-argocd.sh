. ./scripts/utils/wait_for_pods_to_exist.sh --source-only

RED='\e[31m'
GREEN='\e[32m'
BLUE='\e[34m'
RESET='\e[0m'

kubectl create namespace argocd
kubectl create namespace dev

# apply base config to cluster
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "${BLUE}WAITING FOR PODS STARTING...${RESET}"
wait_for_pods_to_exist "argocd" "argocd" 120
kubectl wait --for=condition=Ready pod --all -n "argocd" --timeout=-1s
echo "${BLUE}PODS ARE READY!${RESET}"

# forward ports between cluster and host
kubectl port-forward svc/argocd-server -n argocd 8080:443 >/dev/null 2>/dev/null &

# print password
echo "Argo Cd admin password : "
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
echo ""

# create new argo cd app
kubectl apply -f ./confs/project.yml -n argocd

# expose port to host
echo "${BLUE}WAITING FOR PODS STARTING...${RESET}"
wait_for_pods_to_exist "dev" "wil42" 120
kubectl wait --for=condition=Ready pod --all -n "dev" --timeout=-1s
echo "${BLUE}PODS ARE READY!${RESET}"

kubectl port-forward svc/wil42-playground -n dev 8888:7171 >/dev/null 2>/dev/null &
echo "${GREEN}ArgoCD-UI -> https://localhost:8080${RESET}"
echo "${GREEN}Application -> http://localhost:8888${RESET}"


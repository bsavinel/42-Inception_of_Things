. ./scripts/utils/wait_for_pods_to_exist.sh --source-only

# create namespace for argocd
kubectl create namespace gitlab

helm repo add gitlab https://charts.gitlab.io/
helm repo update
helm upgrade --install gitlab gitlab/gitlab \
	--namespace gitlab \
	--timeout 600s \
	--values https://gitlab.com/gitlab-org/charts/gitlab/-/raw/master/examples/values-minikube-minimum.yaml?ref_type=heads \
	--set global.hosts.domain=localgitlab.com \
	--set global.hosts.externalIP=0.0.0.0 \
	--set global.hosts.https=false

wait_for_pods_to_exist "gitlab" "gitlab" 120

kubectl wait --for=condition=ready --timeout=1200s pod -l app=webservice -n gitlab

echo "Gitlab root password:"
kubectl get secret gitlab-gitlab-initial-root-password -n gitlab -o jsonpath="{.data.password}" | base64 --decode 
echo ""

kubectl port-forward svc/gitlab-webservice-default -n gitlab 8081:8181 2>&1 >/dev/null &
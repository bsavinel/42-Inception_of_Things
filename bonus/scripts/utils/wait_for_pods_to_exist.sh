wait_for_pods_to_exist() {
  local ns=$1
  local pod_name_prefix=$2
  local max_wait_secs=$3
  local interval_secs=2
  local start_time=2
  local current_time=2
  start_time=$(date +%s)
  while true; do

    current_time=$(date +%s)
    if [ $((current_time - start_time)) -gt $max_wait_secs ]; then
      echo "Waited for pods in namespace \"$ns\" with name prefix \"$pod_name_prefix\" to exist for $max_wait_secs seconds without luck. Returning with error."
      return 1
    fi

    if kubectl -n "$ns" describe pod "$pod_name_prefix" --request-timeout "5s" >/dev/null 2>/dev/null; then
      echo "Pods in namespace \"$ns\" with name prefix \"$pod_name_prefix\" exist."
      break
    else
      sleep $interval_secs
    fi
  done
}

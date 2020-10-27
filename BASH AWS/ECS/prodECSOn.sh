CLUSTER_NAME="cluster-receptor"
SERVICE_NAME="api"

aws ecs update-service --cluster $CLUSTER_NAME  --service $SERVICE_NAME --desired-count 2 --force-new-deployment
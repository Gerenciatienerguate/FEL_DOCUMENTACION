CLUSTER_NAME="cluster-receptor"
SERVICE_NAME="ser-api-rest"

aws ecs update-service --cluster $CLUSTER_NAME  --service $SERVICE_NAME --desired-count 1 --force-new-deployment
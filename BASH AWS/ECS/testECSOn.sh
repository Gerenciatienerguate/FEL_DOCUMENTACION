CLUSTER_NAME="cluster-receptor"
SERVICE_NAME="ser-api-rest"

aws application-autoscaling register-scalable-target --service-namespace ecs \
--resource-id service/$CLUSTER_NAME/$SERVICE_NAME \
--scalable-dimension ecs:service:DesiredCount \
--min-capacity 1 \
--max-capacity 2
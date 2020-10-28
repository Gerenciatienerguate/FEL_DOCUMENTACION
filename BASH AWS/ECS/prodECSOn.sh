CLUSTER_NAME="cluster-receptor"
SERVICE_NAME="api"

aws application-autoscaling register-scalable-target --service-namespace ecs \
--resource-id service/$CLUSTER_NAME/$SERVICE_NAME \
--scalable-dimension ecs:service:DesiredCount \
--min-capacity 2 \
--max-capacity 3
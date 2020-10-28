#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

CLUSTER_NAME="cluster-receptor"
SERVICE_NAME="api"

aws application-autoscaling register-scalable-target --service-namespace ecs \
--resource-id service/$CLUSTER_NAME/$SERVICE_NAME \
--scalable-dimension ecs:service:DesiredCount \
--min-capacity 1 \
--max-capacity 2

aws ecs update-service --cluster $CLUSTER_NAME  --service $SERVICE_NAME --desired-count 1 --force-new-deployment

taskArn=$(aws ecs list-tasks --cluster ${CLUSTER_NAME} --service ${SERVICE_NAME} --query "taskArns[0]" --output text)

aws ecs stop-task --cluster $CLUSTER_NAME --task $taskArn
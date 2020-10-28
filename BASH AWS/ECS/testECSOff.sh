#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

CLUSTER_NAME="cluster-receptor"
SERVICE_NAME="ser-api-rest"

aws application-autoscaling register-scalable-target --service-namespace ecs \
--resource-id service/$CLUSTER_NAME/$SERVICE_NAME \
--scalable-dimension ecs:service:DesiredCount \
--min-capacity 0 \
--max-capacity 1

aws ecs update-service --cluster $CLUSTER_NAME  --service $SERVICE_NAME --desired-count 0 --force-new-deployment

index=0

taskArn=$(aws ecs list-tasks --cluster ${CLUSTER_NAME} --service ${SERVICE_NAME} --query "taskArns[${index}]" --output text)

until [ "$taskArn" = "None" ]
do 
  aws ecs stop-task --cluster $CLUSTER_NAME --task $taskArn
  ((index++))
  taskArn=$(aws ecs list-tasks --cluster ${CLUSTER_NAME} --service ${SERVICE_NAME} --query "taskArns[${index}]" --output text)
done

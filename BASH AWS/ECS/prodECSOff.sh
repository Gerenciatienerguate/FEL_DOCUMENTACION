#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

CLUSTER_NAME="cluster-receptor"
SERVICE_NAME="api"

aws ecs update-service --cluster $CLUSTER_NAME  --service $SERVICE_NAME --desired-count 1 --force-new-deployment

taskArn=$(aws ecs list-tasks --cluster ${CLUSTER_NAME} --service ${SERVICE_NAME} --query "taskArns[0]" --output text)

aws ecs stop-task --cluster $CLUSTER_NAME --task $taskArn
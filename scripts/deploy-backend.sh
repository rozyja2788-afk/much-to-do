#!/bin/bash
set -e

if [ -z "$ASG_NAME" ]; then
  echo "ASG_NAME is missing"
  exit 1
fi

echo "Starting rolling deployment for $ASG_NAME"

aws autoscaling start-instance-refresh \
  --auto-scaling-group-name "$ASG_NAME" \
  --preferences MinHealthyPercentage=50,InstanceWarmup=120

echo "Instance refresh started"

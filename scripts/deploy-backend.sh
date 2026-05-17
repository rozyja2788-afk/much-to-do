#!/usr/bin/env bash
set -euo pipefail

: "${ASG_NAME:?ASG_NAME is required}"

echo "Starting backend rolling update for Auto Scaling Group: $ASG_NAME"

aws autoscaling start-instance-refresh \
  --auto-scaling-group-name "$ASG_NAME" \
  --preferences '{"MinHealthyPercentage": 50, "InstanceWarmup": 120}'

echo "Backend rolling deployment started."

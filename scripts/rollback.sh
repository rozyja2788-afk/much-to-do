#!/usr/bin/env bash
set -euo pipefail

: "${ASG_NAME:?ASG_NAME is required}"

echo "Cancelling active instance refresh if one exists..."

aws autoscaling cancel-instance-refresh \
  --auto-scaling-group-name "$ASG_NAME" || true

echo "Rollback placeholder completed."
echo "To fully roll back, re-tag a previous backend image as latest, push it, then redeploy."

#!/usr/bin/env bash
set -euo pipefail

: "${BACKEND_URL:?BACKEND_URL is required}"

echo "Checking backend health at ${BACKEND_URL}/health"

for i in {1..20}; do
  STATUS_CODE=$(curl -s -o /tmp/health-response.txt -w "%{http_code}" "${BACKEND_URL}/health" || true)

  if [ "$STATUS_CODE" = "200" ]; then
    echo "Backend is healthy."
    cat /tmp/health-response.txt
    exit 0
  fi

  echo "Attempt $i failed with status code: $STATUS_CODE"
  sleep 10
done

echo "Backend health check failed."
cat /tmp/health-response.txt || true
exit 1

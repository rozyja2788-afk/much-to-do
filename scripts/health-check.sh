#!/bin/bash
set -e

if [ -z "$BACKEND_URL" ]; then
  echo "BACKEND_URL is missing"
  exit 1
fi

echo "Checking backend health at $BACKEND_URL/health"

curl -f "$BACKEND_URL/health"

echo "Backend health check passed"

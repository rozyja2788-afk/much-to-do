#!/bin/bash
set -e

if [ -z "$S3_BUCKET" ]; then
  echo "S3_BUCKET is missing"
  exit 1
fi

if [ -z "$CLOUDFRONT_DISTRIBUTION_ID" ]; then
  echo "CLOUDFRONT_DISTRIBUTION_ID is missing"
  exit 1
fi

aws s3 sync frontend/dist "s3://$S3_BUCKET" --delete

aws cloudfront create-invalidation \
  --distribution-id "$CLOUDFRONT_DISTRIBUTION_ID" \
  --paths "/*"

#!/usr/bin/env bash
set -euo pipefail

: "${FRONTEND_BUCKET_NAME:?FRONTEND_BUCKET_NAME is required}"
: "${CLOUDFRONT_DISTRIBUTION_ID:?CLOUDFRONT_DISTRIBUTION_ID is required}"

BUILD_DIR="${BUILD_DIR:-frontend/dist}"

if [ ! -d "$BUILD_DIR" ]; then
  echo "Build directory not found: $BUILD_DIR"
  exit 1
fi

echo "Deploying frontend to S3 bucket: $FRONTEND_BUCKET_NAME"
aws s3 sync "$BUILD_DIR" "s3://${FRONTEND_BUCKET_NAME}" --delete

echo "Invalidating CloudFront distribution: $CLOUDFRONT_DISTRIBUTION_ID"
aws cloudfront create-invalidation \
  --distribution-id "$CLOUDFRONT_DISTRIBUTION_ID" \
  --paths "/*"

echo "Frontend deployed successfully."

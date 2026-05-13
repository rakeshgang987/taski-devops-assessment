#!/bin/bash

set -e

PREVIOUS_IMAGE=$1

if [ -z "$PREVIOUS_IMAGE" ]; then
  echo "Usage: ./rollback.sh <previous-image>"
  exit 1
fi

echo "Stopping current container..."
docker stop taski-app || true

echo "Removing current container..."
docker rm taski-app || true

echo "Starting previous stable version..."

docker run -d -p 3000:3000 \
  --name taski-app \
  $PREVIOUS_IMAGE

echo "Rollback completed successfully!"
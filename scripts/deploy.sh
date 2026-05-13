#!/bin/bash

set -e

IMAGE="833319601533.dkr.ecr.us-east-1.amazonaws.com/dev-node-app-repo:latest"

echo "Starting deployment..."

echo "Pulling latest Docker image..."
docker pull $IMAGE

echo "Stopping existing container..."
docker stop taski-app || true

echo "Removing old container..."
docker rm taski-app || true

echo "Starting new container..."
docker run -d -p 3000:3000 \
  --name taski-app \
  $IMAGE

echo "Waiting for application startup..."
sleep 10

echo "Running health check..."

if curl -f http://localhost:3000/health; then
  echo "Deployment successful!"
else
  echo "Deployment failed!"
  exit 1
fi  
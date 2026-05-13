#!/bin/bash

URL="http://localhost:3000/health"

echo "Checking application health..."

STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)

if [ "$STATUS" -eq 200 ]; then
  echo "Application is healthy"
  exit 0
else
  echo "Application is unhealthy"
  exit 1
fi
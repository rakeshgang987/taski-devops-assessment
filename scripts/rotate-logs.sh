#!/bin/bash

LOG_DIR="/var/log/taski"

echo "Creating log directory if missing..."

mkdir -p $LOG_DIR

echo "Compressing large log files..."

find $LOG_DIR -type f -name "*.log" -size +10M -exec gzip {} \;

echo "Log rotation completed!"
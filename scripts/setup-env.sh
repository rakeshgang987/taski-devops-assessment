#!/bin/bash

set -e

echo "Updating packages..."

sudo apt update -y

echo "Installing Docker..."

sudo apt install -y docker.io

echo "Installing AWS CLI..."

sudo apt install -y awscli

echo "Installing Curl..."

sudo apt install -y curl

echo "Starting Docker service..."

sudo systemctl enable docker
sudo systemctl start docker

echo "Adding ubuntu user to docker group..."

sudo usermod -aG docker ubuntu

echo "Environment setup completed!"
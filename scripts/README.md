<!-- # Automation Scripts Documentation

This directory contains production-grade operational automation scripts for the taSki DevOps assessment project.

---

# 1. deploy.sh

## Purpose
Deploys the latest Docker image to the EC2 instance.

## Features
- Pull latest image from ECR
- Stop old container
- Remove old container
- Start new container
- Run health checks

## Usage

```bash
./deploy.sh
```

---

# 2. rollback.sh

## Purpose
Rollback deployment to a previous stable image.

## Usage

```bash
./rollback.sh <previous-image>
```

Example:

```bash
./rollback.sh dev-node-app-repo:v1
```

---

# 3. health-check.sh

## Purpose
Validate application availability and health endpoint.

## Usage

```bash
./health-check.sh
```

Exit Codes:
- 0 = healthy
- 1 = unhealthy

---

# 4. setup-env.sh

## Purpose
Bootstrap a new Ubuntu server with required dependencies.

## Installed Components
- Docker
- AWS CLI
- Curl

## Usage

```bash
./setup-env.sh
```

---

# 5. rotate-logs.sh

## Purpose
Compress and rotate oversized log files.

## Features
- Prevent disk exhaustion
- Compress logs over 10MB

## Usage

```bash
./rotate-logs.sh
``` -->
###########################################################

---

# scripts/README.md

````md
# Automation Scripts Documentation

## Overview

This directory contains production-grade operational automation scripts used for deployment management, rollback handling, environment setup, application health validation, and log maintenance.

The scripts are written in Bash and designed to follow DevOps operational best practices.

---

# Available Scripts

| Script | Purpose |
|---|---|
| deploy.sh | Deploy latest Docker image |
| rollback.sh | Roll back to previous image |
| health-check.sh | Validate application health |
| setup-env.sh | Configure new EC2 server |
| rotate-logs.sh | Compress oversized log files |

---

# 1. deploy.sh

## Purpose

Automates deployment of the latest Docker image from AWS ECR to the EC2 instance.

---

## Features

- Pull latest image from ECR
- Stop existing container safely
- Remove old container
- Start new application container
- Execute health checks
- Fail deployment on unhealthy state

---

## Deployment Workflow

1. Pull latest Docker image
2. Stop current container
3. Remove old container
4. Launch new container
5. Wait for startup
6. Execute health check
7. Mark deployment successful

---

## Usage

```bash
./deploy.sh


Example Output
```
    tarting deployment...
    Pulling latest Docker image...
    Stopping existing container...
    Starting new container...
    Running health check...
    Deployment successful!
```

2. rollback.sh
Purpose

Restores the application to a previously stable Docker image if a deployment fails.

### Features

Graceful rollback
Container replacement
Previous image restoration
Error handling support

### Rollback Workflow
Stop running container
Remove failed container
Start previous stable image
Restore application service

Usage
```
./rollback.sh <previous-image>
```
Example
```
./rollback.sh dev-node-app-repo:v1
```

3. health-check.sh
### Purpose

Checks application availability using the /health endpoint.

### Features
HTTP status validation
Health endpoint monitoring
Exit code support for automation

### Health Check Workflow
Send HTTP request to application
Validate HTTP status code
Return success or failure

Usage
``
./health-check.sh
```

Exit Codes
Exit Code	            Meaning
0	                    Application healthy
1	                    Application unhealthy


4. setup-env.sh
### Purpose

Bootstraps a fresh Ubuntu EC2 instance with required software dependencies.

### Installed Components
Docker
AWS CLI
Curl

### Features
Automated package installation
Docker service initialization
Docker auto-start configuration
User permission configuration

### Setup Workflow
Update package repository
Install Docker
Install AWS CLI
Install Curl
Enable Docker service
Start Docker service
Configure Docker permissions

Usage
```
./setup-env.sh
```
5. rotate-logs.sh
### Purpose

Prevents disk exhaustion by compressing oversized log files.

### Features
Automatic log compression
Log rotation support
Disk space management

### Log Rotation Workflow
Create log directory if missing
Scan for oversized log files
Compress logs larger than 10MB
Preserve archived logs

Usage
```
./rotate-logs.sh
```
### Script Permissions
Grant executable permissions:
```
chmod +x scripts/*.sh
```
### Operational Best Practices Implemented
Error handling using set -e
Meaningful console logging
Health validation
Idempotent operations where applicable
Safe container replacement
Graceful rollback support
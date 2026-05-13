<!-- # taSki DevOps Engineer Technical Assessment

## Project Overview

This project demonstrates a production-ready DevOps implementation for a Node.js application using Infrastructure as Code, CI/CD automation, Docker containerization, and operational scripting.

The infrastructure and deployment pipeline were designed following modern DevOps and security best practices.

---

# Technology Stack

| Component | Technology |
|---|---|
| Cloud Provider | AWS |
| Infrastructure as Code | Terraform |
| CI/CD Platform | GitHub Actions |
| Containerization | Docker |
| Container Registry | AWS ECR |
| Compute | AWS EC2 |
| Monitoring | CloudWatch |
| Automation Scripts | Bash |
| Version Control | GitHub |

---

# Architecture Overview

## Infrastructure Components

- VPC
- Public Subnet
- Internet Gateway
- Security Groups
- EC2 Instance
- IAM Roles & Policies
- AWS ECR Repository
- S3 Backend for Terraform State
- DynamoDB State Locking
- CloudWatch Logging

---

# CI/CD Pipeline Flow

Developer Push → GitHub Actions → Test → Security Scan → Docker Build → Push to ECR → Deploy to EC2 → Health Check

---

# Project Structure

```bash
taski-devops-assessment/
│
├── app/
├── terraform/
├── scripts/
├── docs/
├── .github/workflows/
└── README.md
```

---

# Infrastructure as Code

Terraform provisions:
- Networking resources
- EC2 compute
- ECR repository
- IAM roles
- Security groups

Environment-specific configurations:
- dev.tfvars
- staging.tfvars
- prod.tfvars

---

# CI/CD Pipeline Stages

## 1. Source Stage
Triggered automatically on push to the main branch.

## 2. Build Stage
- Install dependencies
- Build Docker image

## 3. Test Stage
- Jest unit tests
- ESLint validation

## 4. Security Scan Stage
- npm audit vulnerability scan

## 5. Containerization Stage
- Docker image build
- Push image to AWS ECR

## 6. Deployment Stage
- SSH deployment to EC2
- Rolling container replacement

## 7. Health Check Stage
- Application availability validation

---

# Security Best Practices

- No credentials stored in source code
- GitHub Secrets used for sensitive values
- Least privilege IAM principles applied
- Docker image scanning enabled
- Infrastructure managed as code
- Health checks implemented
- Secure SSH authentication

---

# Running the Project Locally

## Clone Repository

```bash
git clone https://github.com/rakeshgang987/taski-devops-assessment.git
```

## Start Application

```bash
cd app
npm install
npm start
```

## Run Tests

```bash
npm test
```

---

# Docker Commands

## Build Image

```bash
docker build -t taski-node-app:v1 .
```

## Run Container

```bash
docker run -d -p 3000:3000 taski-node-app:v1
```

---

# Terraform Commands

## Initialize Terraform

```bash
terraform init
```

## Plan Infrastructure

```bash
terraform plan -var-file="environments/dev.tfvars"
```

## Apply Infrastructure

```bash
terraform apply -var-file="environments/dev.tfvars"
```

## Destroy Infrastructure

```bash
terraform destroy -var-file="environments/dev.tfvars"
```

---

# Automation Scripts

Scripts are located inside:

```bash
scripts/
```

Included scripts:
- deploy.sh
- rollback.sh
- health-check.sh
- setup-env.sh
- rotate-logs.sh

---

# Documentation

## Architecture Diagram

Located in:

```bash
docs/architecture-diagram.png
```

## Pipeline Screenshot

Located in:

```bash
docs/pipeline-success.png
```

---

# Future Improvements

- Kubernetes deployment
- ECS/EKS migration
- Blue/Green deployment strategy
- Auto-scaling groups
- Prometheus & Grafana monitoring
- SonarQube integration

---

# Author

Rakesh Gangwar -->

Root README.md
# taSki DevOps Engineer Technical Assessment
  ## Overview
  
  This repository contains a complete production-style DevOps implementation for a Node.js web application as part of the taSki DevOps Engineer Technical Assessment.
  
  The project demonstrates:

- Infrastructure provisioning using Terraform
- CI/CD automation using GitHub Actions
- Docker containerization
- AWS cloud deployment
- Production-grade automation scripts
- DevOps security best practices
- Environment-based infrastructure configuration

The entire infrastructure and deployment workflow is fully automated and follows Infrastructure as Code (IaC) principles.

---

# Solution Architecture

## High-Level Flow

Developer Push → GitHub Repository → GitHub Actions Pipeline → Build & Test → Security Scan → Docker Build → Push to AWS ECR → Deploy to EC2 → Health Check

---

# Technology Stack

| Category | Technology |
|---|---|
| Cloud Provider | AWS |
| Infrastructure as Code | Terraform |
| CI/CD Platform | GitHub Actions |
| Containerization | Docker |
| Container Registry | AWS Elastic Container Registry (ECR) |
| Compute Service | AWS EC2 |
| Monitoring | AWS CloudWatch |
| Programming Language | Node.js |
| Automation Scripts | Bash |
| Version Control | Git & GitHub |

---

# Infrastructure Components

The following infrastructure components are provisioned using Terraform:

## Networking

- VPC
- Public Subnet
- Internet Gateway
- Route Tables
- Security Groups


## Compute


- EC2 Instance running Docker


## Container Registry


- AWS ECR Repository


## Terraform Backend


- S3 Bucket for remote Terraform state
- DynamoDB Table for state locking


## Security


- IAM Roles and Policies
- Security Groups with restricted access
- GitHub Secrets for sensitive values


## Monitoring & Logging


- CloudWatch Logs
- Health check endpoint


---


# Project Directory Structure


```
taski-devops-assessment/
│
├── app/
│   ├── server.js
│   ├── package.json
│   ├── Dockerfile
│   ├── .dockerignore
│   └── tests/
│
├── terraform/
│   ├── provider.tf
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── backend.tf
│   └── environments/
│       ├── dev.tfvars
│       ├── staging.tfvars
│       └── prod.tfvars
│
├── .github/
│   └── workflows/
│       └── ci-cd.yml
│
├── scripts/
│   ├── deploy.sh
│   ├── rollback.sh
│   ├── health-check.sh
│   ├── setup-env.sh
│   ├── rotate-logs.sh
│   └── README.md
│
├── docs/
│   ├── architecture-diagram.png
│   └── pipeline-success.png
│
└── README.md
```
#### Application Overview

The application is a lightweight Node.js Express web application with:

Root endpoint
Health check endpoint
Docker support
Unit testing support
CI/CD integration
Available Endpoints
Root Endpoint
```
GET /
```

Response:
```
{
  "status": "success",
  "message": "Node.js DevOps Assessment App Running"
}
```
Health Check Endpoint
```
GET /health

```

Response:
```
{
  "status": "healthy"
}
```

####  Prerequisites

Before running this project, ensure the following tools are installed:
```
Tool                    Version
Node.js	                20+
Docker	                Latest
Terraform	            1.5+
AWS CLI	                Latest
Git	                    Latest

```
#####  Local Development Setup
Step 1 — Clone Repository
```
git clone https://github.com/rakeshgang987/taski-devops-assessment.git
```
Step 2 — Navigate to Project
```
cd taski-devops-assessment
```
Step 3 — Install Application Dependencies
```
cd app
npm install
```
Step 4 — Start Application
```
npm start
```
Application runs on:

http://localhost:3000

Step 5 — Test Application

Health check:
```
curl http://localhost:3000/health
```
#### Running Tests
Execute Unit Tests
```
npm test
```
Run Linting
```
npm run lint
```
#### Docker Setup
Build Docker Image

Navigate to app directory:
```
cd app
```
Build image:
```
docker build -t taski-node-app:v1 .
```
### Run Docker Container
```
docker run -d -p 3000:3000 --name taski-app taski-node-app:v1
```
Verify Running Container
```
docker ps
```
#### AWS Configuration
Configure AWS CLI
```
aws configure
```
Provide:
```
*AWS Access Key
*AWS Secret Key
*Region
*Output format
```
#### Terraform Infrastructure Deployment
Navigate to Terraform Directory
```
cd terraform
```
Initialize Terraform
```
terraform init
```
This downloads providers and configures the remote backend.

### Validate Terraform Configuration

```
terraform validate
```
Preview Infrastructure Changes
```
terraform plan -var-file="environments/dev.tfvars"
```
Deploy Infrastructure
```
terraform apply -var-file="environments/dev.tfvars"

Type:

yes

Terraform provisions:

VPC
Subnet
Security Group
EC2 Instance
ECR Repository
IAM Roles
CloudWatch resources

### Retrieve Outputs
```
terraform output
```
Example outputs:
```
EC2 Public IP
ECR Repository URL
```

####  CI/CD Pipeline

#### The project uses GitHub Actions for CI/CD automation.

Pipeline Stages
1. Source Stage

Triggered automatically on push to the main branch.

2. Build Stage
Checkout repository
Install Node.js dependencies
Build Docker image

3. Test Stage
Run Jest unit tests
Run ESLint validation

4. Security Scan Stage
Execute npm audit
Scan dependencies for vulnerabilities

5. Containerization Stage
Build Docker image
Tag image using semantic versioning
Push image to AWS ECR

6. Deployment Stage
SSH into EC2 instance
Pull latest Docker image
Stop existing container
Start updated container

7. Health Check Stage
Validate application health endpoint
Ensure deployment success
GitHub Actions Secrets

The following GitHub Secrets are configured:

Secret	                            Purpose
AWS_ACCESS_KEY_ID	                AWS authentication
AWS_SECRET_ACCESS_KEY	            AWS authentication
EC2_HOST	                        EC2 public IP
EC2_USER	                        SSH user
EC2_SSH_KEY	                        Private SSH key


###  Security Best Practices Implemented
### Secrets Management
No credentials stored in source code
GitHub Secrets used for CI/CD
SSH private key secured in GitHub Secrets

### IAM Security

Principle of least privilege applied
IAM roles scoped to required services only

### Infrastructure Security
* Infrastructure managed entirely through Terraform
* No manual infrastructure changes
* Remote Terraform backend enabled
* Terraform state locking enabled

#### Container Security
* Dependency vulnerability scanning enabled
* Dockerized deployment
* Immutable deployment artifacts

### Operational Security
* Health checks implemented
* Log rotation automation included
* Deployment rollback supported

#### Monitoring & Logging

The solution includes:

* Application health checks
* CloudWatch integration
* Deployment verification

### Docker container monitoring

Documentation Assets
# Architecture Diagram

![Architecture Diagram](docs/architecture-diagram.png)
Pipeline Screenshot

# Pipeline Screenshot

![Pipeline Screenshot](docs/pipeline-screenshot.png)

Future Improvements

Potential production enhancements:

* Kubernetes deployment
* ECS/EKS migration
* Blue/Green deployments
* Auto Scaling Groups
* Prometheus monitoring
* Grafana dashboards
* SonarQube integration
* SSL/TLS with Application Load Balancer

#### Cleanup

To destroy infrastructure:
```
cd terraform
terraform destroy -var-file="environments/dev.tfvars"
```
Author

Rakesh Gang


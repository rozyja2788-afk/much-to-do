# StartTech Application

This repository contains the frontend and backend application code for the Month 3 DevOps assessment.

## Components

- Frontend: React application deployed to AWS S3 and CloudFront
- Backend: Golang API deployed to EC2 Auto Scaling Group behind an ALB
- Redis: ElastiCache Redis cluster
- MongoDB: MongoDB Atlas database

## CI/CD Pipelines

### Frontend Pipeline

The frontend GitHub Actions workflow:

1. Installs dependencies
2. Runs tests
3. Runs npm audit
4. Builds production React bundle
5. Deploys build files to S3
6. Invalidates CloudFront cache

### Backend Pipeline

The backend GitHub Actions workflow:

1. Runs Go tests
2. Runs code quality checks
3. Scans vulnerabilities
4. Builds Docker image
5. Pushes image to Amazon ECR
6. Deploys backend using rolling update
7. Runs smoke tests
8. Sends logs to CloudWatch

## Repository Structure

starttech-application/
├── .github/workflows/
├── backend/
├── frontend/
├── scripts/
└── README.md

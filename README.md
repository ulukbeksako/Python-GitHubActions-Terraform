# Python Flask CI/CD Pipeline with GitHub Actions and Terraform

This project demonstrates a complete CI/CD pipeline for deploying a Python Flask application to AWS ECS using **GitHub Actions** for automation and **Terraform** for infrastructure provisioning.

## Key Features
- **Python Flask Application**:
  A simple web application built using Flask.
- **Containerization**:
  Docker is used to package the application into a portable container.
- **CI/CD Automation**:
  GitHub Actions automates testing, building, and deployment processes.
- **Infrastructure as Code**:
  Terraform provisions the AWS ECS infrastructure.

## Project Structure
- `app/`: Contains the Python Flask application and its dependencies.
- `terraform/`: Infrastructure configuration for AWS ECS.
- `.github/workflows/`: GitHub Actions workflow for automating CI/CD.

## Steps to Deploy
1. Clone this repository:
   ```bash
   git clone https://github.com/<your-username>/Python-GitHubActions-Terraform.git
   cd Python-GitHubActions-Terraform
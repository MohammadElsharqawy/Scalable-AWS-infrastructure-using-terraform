## Scalable-AWS-infrastructure-using-terraform

## Overview ✔️

This project aims to automate the deployment of infrastructure on Amazon Web Services (AWS) using Terraform. It covers the setup of networking components, compute resources, email notification system using AWS SES, database (RDS), and caching (ElastiCache) instances. Additionally, AWS Secrets Manager is used to securely store the SSH private key

## Features ⬇️

- **Networking Setup:**
  - Creation of VPC with public and private subnets.
  - Configuration of internet gateway and NAT gateway.
  - Establishment of route tables for public and private subnets.
- **Compute Resources:**
  - Deployment of EC2 instances: a Bastion host in the public subnet and an application server in the private subnet.
  - Implementation of security groups for SSH access and application-specific ports.
  - Utilization of remote state and locking mechanism for enhanced collaboration and security.
- **State Management and Environment Workspacest:**
  - S3 Bucket for storing Terraform state files, ensuring a centralized and versioned state.
  - DynamoDB Table for state locking, preventing concurrent state modifications and ensuring safe collaboration.
  - Provisioning of separate workspaces for development (dev) and production (prod) environments.
  - Definition of variable files (`.tfvars`) for each environment to manage configurations effectively.
- **Infrastructure Modularity:**
  - Modularization of network resources into a separate module for better organization and reusability.
- **Email Notification System:**
  - Verification of email in AWS SES service for sending notifications.
  - Creation of a Lambda function to send email alerts triggered by state file changes.
- **Database and Caching:**
  - Deployment of RDS (Relational Database Service) for database management.
  - Configuration of ElastiCache for caching data to improve application performance.
- **Secrets Management:**
  - Secure storage of SSH private key using AWS Secrets Manager.

## Deployment Instructions ⬇️

1. Clone the GitHub repository containing the Terraform code.
2. Set up AWS credentials with appropriate permissions for Terraform.
3. Execute terraform init followed by terraform apply to create the infrastructure.

## Usage

Ensure that all necessary variables are set correctly in the respective .tfvars files for each environment.
Monitor the Terraform output for any errors or warnings during deployment.
After successful deployment, access the bastion host using the provided public IP address and proceed with further configuration if needed.

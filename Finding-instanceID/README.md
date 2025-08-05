# Exercise 01 - Fetch Latest Ubuntu AMI

This exercise demonstrates how to use the `aws_ami` data source in Terraform to fetch the **most recent Ubuntu 22.04 (Jammy)** AMI ID from Canonical's official AWS account.

## What this code does

- Filters AMIs by:
  - Name pattern: `ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*`
  - Virtualization type: `hvm`
- Ensures the AMI is from the official Ubuntu account (`099720109477`)
- Outputs the AMI ID for use in launching EC2 instances

## Usage

1. Initialize Terraform:
   ```bash
   terraform init
   ```

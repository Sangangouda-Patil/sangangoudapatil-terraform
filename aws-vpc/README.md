# Exercise 04 - Create VPC and Launch EC2 Instance

This project creates:

- A **VPC** with **public & private subnets**.
- An **Internet Gateway** and **Route Table** for internet access.
- An **EC2 instance** in the public subnet using the **latest Ubuntu AMI**.

## Project Structure

- `main.tf` → Provider and Terraform setup
- `vars.tf` → Variables (region, zone, AMI map)
- `vpc.tf` → VPC, subnets, IGW, route tables
- `ami.tf` → Fetches the latest Ubuntu AMI
- `ec2instance.tf` → EC2 instance resource
- `outputs.tf` → Outputs (public IP, AMI ID)

## Usage

1. Initialize:
   ```bash
   terraform init
   ```

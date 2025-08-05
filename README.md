# Terraform Projects – My DevOps Learning Journey

Welcome to my collection of **Terraform projects and exercises**!  
This repository documents the **hands-on practice I’ve done while learning Terraform** as part of my DevOps journey.

Each project in this repository represents a **step forward in understanding Infrastructure as Code (IaC)** – from creating simple EC2 instances to building more complex networking setups like custom VPCs, subnets, and IAM user management using YAML.

---

## Table of Contents

1. [EC2 Instance Provisioning](#1-ec2-instance-provisioning)
2. [Key Pairs & Security Groups](#2-key-pairs--security-groups)
3. [S3 Static Website Hosting](#3-s3-static-website-hosting)
4. [Custom VPC with Dynamic Subnets](#4-custom-vpc-with-dynamic-subnets)
5. [IAM User Management with YAML](#5-iam-user-management-with-yaml)
6. [Linux Cheat Sheet](#linux-cheat-sheet)
7. [How to Use](#how-to-use)
8. [Final Note](#final-note)

---

## 1. EC2 Instance Provisioning

- Created AWS EC2 instances using the latest Ubuntu AMI.
- Added tags and outputted public IPs for easy reference.

## 2. Key Pairs & Security Groups

- Generated SSH key pairs.
- Created security groups with ingress and egress rules for SSH and HTTP access.

## 3. S3 Static Website Hosting

- Hosted a static website on S3 with public access policies.
- Uploaded HTML and CSS files for a simple **Netflix Clone** landing page.

## 4. Custom VPC with Dynamic Subnets

- Built a custom VPC with **multiple public and private subnets** using `count`.
- Configured **Internet Gateway & Route Tables** dynamically.

## 5. IAM User Management with YAML

- Created multiple IAM users by **reading user details from a YAML file**.
- Dynamically attached **AWS Managed Policies** based on assigned roles.
- Generated strong random passwords and exported credentials securely.

---

## Linux Cheat Sheet

Along with Terraform, I’ve been building strong Linux fundamentals.  
👉 **[Check out my Linux Cheat Sheet here](https://github.com/Sangangouda-Patil/Linux-cheat-sheet)**

---

## How to Use

1. Clone this repository:

   ```bash
   git clone https://github.com/your-username/terraform-projects.git
   cd terraform-projects

   ```

2. Navigate to any exercise folder.
3. Initialize Terraform:

   ```bash
   terraform init

   ```

4. Review Plan

   ```bash
   terraform plan

   ```

5. Apply to create resources:
   ```bash
   terraform apply
   ```

## Final Note

This repository is a living record of my DevOps journey – as I learn, practice, and refine my skills in Terraform and AWS.
I hope these exercises not only showcase my progress but also serve as a reference for anyone starting their own journey in Infrastructure as Code.

Thank you for visiting! ❤️

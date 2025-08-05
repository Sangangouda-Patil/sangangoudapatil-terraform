# Project 01 - VPC with Dynamic Subnets

This Terraform configuration creates a **custom VPC** with:

- **1 VPC** (10.0.0.0/16)
- **2 Public Subnets** (dynamically created using `count`)
- **2 Private Subnets** (dynamically created using `count`)
- **Internet Gateway** for outbound internet access
- **Public Route Table** associated with public subnets

This setup is a **basic networking foundation** for deploying EC2 instances or other AWS services.

---

## Files

- **main.tf** – Provider, locals, and core configuration
- **(Optional split)** – Can be modularized into `vpc.tf`, `subnets.tf`, `routing.tf`
- **variables.tf** – Variable definitions (region, counts, etc.)
- **outputs.tf** – Outputs for created resources

---

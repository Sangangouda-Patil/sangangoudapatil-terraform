# Terraform AWS VPC Module

This Terraform module provisions an AWS Virtual Private Cloud (VPC) along with public and private subnets, Internet Gateway, and route table associations — all based on user input.

---

## 🚀 Features

- Creates a VPC with custom CIDR and name.
- Provisions multiple public and/or private subnets with custom CIDRs and availability zones.
- Attaches an Internet Gateway automatically when public subnets are defined.
- Creates and associates a route table with public subnets.
- Exposes structured outputs for easy downstream use.

---

## 📦 Usage

```hcl
module "vpc" {
  source = "./module/vpc"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "my-vpc"
  }

  subnet_config = {
    public-1 = {
      cidr_block = "10.0.1.0/24"
      az         = "us-east-1a"
      public     = true
    }
    private-1 = {
      cidr_block = "10.0.2.0/24"
      az         = "us-east-1b"
    }
  }
}
```

###############################################
# Terraform & Provider
###############################################
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

###############################################
# Locals
###############################################
locals {
  project         = "project-01"
  public_subnets  = 2
  private_subnets = 2
}

###############################################
# Variables
###############################################
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

###############################################
# VPC
###############################################
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${local.project}-vpc"
  }
}

###############################################
# Public Subnets (Dynamic)
###############################################
resource "aws_subnet" "public_subnet" {
  count                   = local.public_subnets
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true # So instances in public subnets get public IPs
  tags = {
    Name = "${local.project}-public-subnet-${count.index}"
  }
}

###############################################
# Private Subnets (Dynamic)
###############################################
resource "aws_subnet" "private_subnet" {
  count      = local.private_subnets
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.${count.index + 2}.0/24"
  tags = {
    Name = "${local.project}-private-subnet-${count.index}"
  }
}

###############################################
# Internet Gateway
###############################################
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "${local.project}-igw"
  }
}

###############################################
# Public Route Table
###############################################
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = {
    Name = "${local.project}-public-rt"
  }
}

###############################################
# Associate Public Subnets with Route Table
###############################################
resource "aws_route_table_association" "public_assoc" {
  count          = length(aws_subnet.public_subnet)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

###############################################
# Outputs
###############################################
output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.my_vpc.id
}

output "public_subnets" {
  description = "Public subnet IDs"
  value       = [for s in aws_subnet.public_subnet : s.id]
}

output "private_subnets" {
  description = "Private subnet IDs"
  value       = [for s in aws_subnet.private_subnet : s.id]
}

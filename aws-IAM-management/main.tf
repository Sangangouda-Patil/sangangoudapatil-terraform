###############################################
# Terraform & Provider
###############################################
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
  }
}

provider "aws" {
  region = var.region
}

###############################################
# Variables
###############################################
variable "region" {
  description = "AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}

variable "users_file" {
  description = "Path to YAML file containing IAM users and their roles"
  type        = string
  default     = "./users.yaml"
}

###############################################
# Load Users from YAML
###############################################
locals {
  user_data = yamldecode(file(var.users_file)).users
}

###############################################
# Outputs - List of Users
###############################################
output "iam_users" {
  description = "List of IAM usernames created"
  value       = local.user_data[*].username
}

###############################################
# Create IAM Users
###############################################
resource "aws_iam_user" "users" {
  for_each = { for user in local.user_data : user.username => user }
  name     = each.key
}

###############################################
# Generate Random Passwords
###############################################
resource "random_password" "user_passwords" {
  for_each = aws_iam_user.users
  length   = 16
  special  = true
}

###############################################
# Create Login Profiles
###############################################
resource "aws_iam_user_login_profile" "profile" {
  for_each                = aws_iam_user.users
  user                    = each.value.name
  password_reset_required = true
}

###############################################
# Flatten Roles for Policy Attachments
###############################################
locals {
  user_policies = flatten([
    for user in local.user_data : [
      for role in user.role : {
        username = user.username
        role     = role
      }
    ]
  ])
}

###############################################
# Attach Policies to IAM Users
###############################################
resource "aws_iam_user_policy_attachment" "user_policies" {
  for_each   = { for up in local.user_policies : "${up.username}-${up.role}" => up }
  user       = each.value.username
  policy_arn = "arn:aws:iam::aws:policy/${each.value.role}"
}

###############################################
# Save Credentials to Local File
###############################################
resource "local_file" "user_credentials" {
  content = join("\n", [
    for username, pwd in random_password.user_passwords :
    "${username} : ${pwd.result}"
  ])
  filename = "${path.module}/user_credentials.txt"
}

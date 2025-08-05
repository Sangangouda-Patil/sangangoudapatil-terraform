terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
  backend "s3" {
    bucket = "my-bucket-f8e9aa0767e2b541"
    key    = "backend.tf"
    region = "us-east-1"
  }
}

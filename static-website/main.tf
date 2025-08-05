###############################################
# Terraform Configuration
# - Uses AWS & Random providers
# - Stores remote state in S3 backend
###############################################
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }

  # Remote backend for storing Terraform state
  backend "s3" {
    bucket = "mywebapp-68dc005e94cbabcf" # Existing S3 bucket for backend (change as per setup)
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

###############################################
# AWS Provider
###############################################
provider "aws" {
  region = "us-east-1"
}

###############################################
# Random ID
# Used to generate a unique suffix for the S3 bucket name
###############################################
resource "random_id" "rand_id" {
  byte_length = 8
}

###############################################
# S3 Bucket for Static Website
# Bucket name includes random suffix to ensure uniqueness
###############################################
resource "aws_s3_bucket" "mywebapp_bucket" {
  bucket = "mywebapp-${random_id.rand_id.hex}"
}

###############################################
# Public Access Block Configuration
# - Blocks ACLs but allows bucket policies for website hosting
###############################################
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mywebapp_bucket.id

  block_public_acls       = true  # Block public ACLs
  block_public_policy     = false # Allow bucket policy for website hosting
  ignore_public_acls      = true
  restrict_public_buckets = false
}

###############################################
# Bucket Policy: Allow Public Read Access
# Grants public read (GET) access for all objects in the bucket
###############################################
resource "aws_s3_bucket_policy" "allow_web_access" {
  bucket = aws_s3_bucket.mywebapp_bucket.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "arn:aws:s3:::${aws_s3_bucket.mywebapp_bucket.id}/*"
      }
    ]
  })
}

###############################################
# Upload Website Files
# Uploads HTML and CSS files to the S3 bucket
###############################################
resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.mywebapp_bucket.bucket
  source       = "./index.html"
  key          = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "style_css" {
  bucket       = aws_s3_bucket.mywebapp_bucket.bucket
  source       = "./style.css"
  key          = "style.css"
  content_type = "text/css"
}

###############################################
# Website Hosting Configuration
# Sets up the S3 bucket to serve a static website
###############################################
resource "aws_s3_bucket_website_configuration" "mywebapp" {
  bucket = aws_s3_bucket.mywebapp_bucket.id

  index_document {
    suffix = "index.html"
  }
}

###############################################
# Outputs
###############################################
output "website_url" {
  description = "Static website endpoint URL"
  value       = aws_s3_bucket_website_configuration.mywebapp.website_endpoint
}

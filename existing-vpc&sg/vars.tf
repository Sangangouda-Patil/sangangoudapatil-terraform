variable "region" {
  default = "us-east-1"
}

variable "zon1" {
  default = "us-east-1a"
}

# variable "aws_instance_type" {
#   description = "What type of instance you want to create?"
#   type        = string
#   # default = "t2.micro"

# #   validation {
# #     condition     = var.aws_instance_type == "t2.micro" || var.aws_instance_type == "t3.micro"
# #     error_message = "Only t2.micro and t3.micro is allowed"

# #   }
# # }


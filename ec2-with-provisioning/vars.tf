###############################################
# Variables
###############################################
variable "region" {
  default = "us-east-1"
}

variable "zone1" {
  default = "us-east-1a"
}

variable "webuser" {
  default = "ubuntu"
}

# Optional: Use a static AMI map (in case data source fails)
variable "amiID" {
  type = map(any)
  default = {
    us-east-2 = "ami-0d1b5a8c13042c939"
    us-east-1 = "ami-020cba7c55df1f615"
  }
}

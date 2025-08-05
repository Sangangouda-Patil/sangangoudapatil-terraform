# Variable for VPC configuration: expects a name and CIDR block
variable "vpc_config" {
  description = "Configuration for the VPC: name and CIDR block"
  type = object({
    cidr_block = string
    name       = string
  })

  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "Invalid CIDR format - ${var.vpc_config.cidr_block}"
  }
}

# Variable for Subnet configurations: expects a map of subnet definitions
variable "subnet_config" {
  description = "Configuration for subnets: CIDR, AZ, and optional public flag"
  type = map(object({
    cidr_block = string
    az         = string
    public     = optional(bool, false)
  }))

  validation {
    condition     = alltrue([for config in var.subnet_config : can(cidrnetmask(config.cidr_block))])
    error_message = "Invalid CIDR format for one or more subnets"
  }
}

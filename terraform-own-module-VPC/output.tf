# Output the ID of the created VPC
output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.main.id
}

# Local values to structure public subnet output
locals {
  public_subnet_output = {
    for key, config in local.public_subnet : key => {
      subnet_id = aws_subnet.main[key].id
      az        = aws_subnet.main[key].availability_zone
    }
  }

  private_subnet_output = {
    for key, config in local.private_subnet : key => {
      subnet_id = aws_subnet.main[key].id
      az        = aws_subnet.main[key].availability_zone
    }
  }
}

# Output public subnets with IDs and availability zones
output "public_subnets" {
  description = "Map of public subnet names to their IDs and availability zones"
  value       = local.public_subnet_output
}

# Output private subnets with IDs and availability zones
output "private_subnets" {
  description = "Map of private subnet names to their IDs and availability zones"
  value       = local.private_subnet_output
}

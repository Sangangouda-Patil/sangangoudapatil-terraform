#Security group ID
data "aws_security_group" "name" {
  tags = {
    Name = "mainvpc-sg"
  }
}

output "security_group" {
  description = "Security group ID"
  value       = data.aws_security_group.name.name
}


#Vpc ID
#Security group ID
data "aws_vpc" "ID" {
  tags = {
    Name = "my-vpc"
  }
}

output "aws_vpc" {
  description = "Vpc ID"
  value       = data.aws_vpc.ID
}

#Az 
data "aws_availability_zones" "names" {
  state = "available"

}

output "names" {
  description = "AZ in your region"
  value       = data.aws_availability_zones.names
}


#Subnet ID
data "aws_subnet" "name" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.ID.id]
  }
  tags = {
    Name = "private-subnet"
  }
}

output "subnet_id" {
  description = "Security group ID"
  value       = data.aws_subnet.name.id
}


output "ec2_instance_name" {
  description = "Name tag of the EC2 instance"
  value       = aws_instance.web.tags["Name"]
}

output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.web.public_ip
}

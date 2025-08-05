###############################################
# Outputs
###############################################
output "ami_id" {
  description = "The latest Ubuntu AMI ID"
  value       = data.aws_ami.amiID.id
}

output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.web.public_ip
}

output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.web.id
}

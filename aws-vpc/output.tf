###############################################
# Outputs
###############################################
output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.my_webapp.public_ip
}

output "instance_ami_id" {
  description = "AMI ID used for the instance"
  value       = data.aws_ami.amiID.id
}

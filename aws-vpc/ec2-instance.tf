###############################################
# EC2 Instance
###############################################
resource "aws_instance" "my_webapp" {
  ami           = data.aws_ami.amiID.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  # associate_public_ip_address = true  # Optional: For direct SSH access

  tags = {
    Name    = "my-webapp"
    Project = "my-webapp"
  }
}

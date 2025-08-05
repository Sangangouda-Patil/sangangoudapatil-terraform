###############################################
# EC2 Instance - Dove Project
###############################################
resource "aws_instance" "web" {
  ami                    = data.aws_ami.amiID.id # Latest Ubuntu AMI
  instance_type          = "t3.micro"            # Instance type
  key_name               = aws_key_pair.dove_key.key_name
  vpc_security_group_ids = [aws_security_group.dove_sg.id]
  availability_zone      = "us-east-1a" # Change as needed

  tags = {
    Name    = "Dove-web"
    Project = "Dove"
  }
}

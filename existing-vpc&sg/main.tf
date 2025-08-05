resource "aws_instance" "web" {
  ami           = "ami-0150ccaf51ab55a51" # Replace with an AMI valid in your region
  instance_type = "t3.micro"
  #   key_name               = aws_key_pair.dove-key.key_name
  subnet_id              = data.aws_subnet.name.id
  vpc_security_group_ids = [data.aws_security_group.name.id]
  availability_zone      = "us-east-1a"
  #   associate_public_ip_address = true

  tags = {
    Name    = "myapp"
    Project = "myapp"
  }
}

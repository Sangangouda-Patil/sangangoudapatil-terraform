###############################################
# EC2 Instance with Provisioners
###############################################
resource "aws_instance" "webapp" {
  ami                    = var.amiID[var.region] # Or use: data.aws_ami.amiID.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.webapp_key.key_name
  vpc_security_group_ids = [aws_security_group.webapp_sg.id]
  availability_zone      = var.zone1

  tags = {
    Name    = "webapp"
    Project = "webapp"
  }

  # Upload setup script
  provisioner "file" {
    source      = "webapp.sh"
    destination = "/tmp/webapp.sh"
  }

  # Connect to EC2
  connection {
    type        = "ssh"
    user        = var.webuser
    private_key = file("webappkey") # <-- Keep your private key local (not in repo)
    host        = self.public_ip
  }

  # Run setup script
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/webapp.sh",
      "sudo /tmp/webapp.sh"
    ]
  }
}

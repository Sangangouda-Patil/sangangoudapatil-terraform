###############################################
# Security Group: Allow SSH (My IP) & HTTP (All)
###############################################
resource "aws_security_group" "dove_sg" {
  name        = "dove-sg"
  description = "Security group for Dove project (SSH + HTTP)"

  tags = {
    Name = "dove-sg"
  }
}

# Ingress: Allow SSH from My IP
resource "aws_vpc_security_group_ingress_rule" "allow_ssh_from_my_ip" {
  security_group_id = aws_security_group.dove_sg.id
  cidr_ipv4         = "YOUR_PUBLIC_IP/32" # Replace dynamically
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# Ingress: Allow HTTP from anywhere
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.dove_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

# Egress: Allow all outbound (IPv4 & IPv6)
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_ipv4" {
  security_group_id = aws_security_group.dove_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_ipv6" {
  security_group_id = aws_security_group.dove_sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}

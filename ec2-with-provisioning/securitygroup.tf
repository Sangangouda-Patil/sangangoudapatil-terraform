###############################################
# Security Group for EC2
###############################################
resource "aws_security_group" "webapp_sg" {
  name        = "webapp-sg"
  description = "Allow SSH & HTTP"
  tags = {
    Name = "webapp-sg"
  }
}

# Allow SSH from your IP
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.webapp_sg.id
  cidr_ipv4         = "106.196.31.117/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# Allow HTTP from anywhere
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.webapp_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

# Allow all outbound traffic
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_ipv4" {
  security_group_id = aws_security_group.webapp_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_ipv6" {
  security_group_id = aws_security_group.webapp_sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}

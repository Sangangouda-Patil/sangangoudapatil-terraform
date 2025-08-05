resource "aws_security_group" "mainvpc-sg" {
  name        = "mainvpc-sg"
  description = "mainvpc-sg"
  vpc_id      = aws_vpc.my-vpc.id

  tags = {
    Name = "mainvpc-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_sshfrommyip" {
  security_group_id = aws_security_group.mainvpc-sg.id
  cidr_ipv4         = "106.196.31.117/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.mainvpc-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_ipv4" {
  security_group_id = aws_security_group.mainvpc-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_ipv6" {
  security_group_id = aws_security_group.mainvpc-sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

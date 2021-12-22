resource "aws_security_group" "vpc-public-security-group" {
  vpc_id = var.vpc_id
  name   = "${var.environment}-public-security-group"
  ingress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = var.vpc_cidr_block
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
tags = {
  Name = "${var.environment}-public"
    }
}

resource "aws_security_group" "vpc-private-security-group" {
  vpc_id = var.vpc_id
  name = "${var.environment}-private-security-group"
  ingress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    description = "vpc-traffic"
    cidr_blocks = var.vpc_cidr_block
  }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    description = "All traffic"
    cidr_blocks = ["0.0.0.0/0"]
  }

tags = {
  Name = "${var.environment}-private"
    }
}

resource "aws_security_group_rule" "public_inbound-rules" {
  from_port = 80
  protocol = "tcp"
  security_group_id = aws_security_group.vpc-public-security-group.id
  to_port = 80
  type = "ingress"
  description = "Allow https traffic worldwide"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "public_inbound-rules_1" {
  from_port = 22
  protocol = "tcp"
  security_group_id = aws_security_group.vpc-public-security-group.id
  to_port = 22
  type = "ingress"
  description = "Srinath"
  cidr_blocks = ["157.32.168.5/32"]
}
output "public_security_group_id" {
  value = aws_security_group.vpc-public-security-group.id
}

output "private_security_group_id" {
  value = aws_security_group.vpc-private-security-group.id
}
resource "aws_instance" "App" {
  availability_zone      = var.availability_zone
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key
  subnet_id              = var.subnet
  vpc_security_group_ids = [var.security_group]
  associate_public_ip_address = true
  private_ip             = var.privateip
  tags                   = {
    Name = var.tag
  }
  user_data = <<EOF
#!/bin/bash
yum install epel-release -y
yum install java-1.8.0-openjdk-devel -y
EOF
}

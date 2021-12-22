resource "aws_instance" "web" {
  ami = var.ami
  instance_type  = var.instance_type
  subnet_id      = var.subnet
  vpc_security_group_ids = [var.security_group]
  private_ip = var.privateip
  key_name = "xwiggy-key"
  tags = {
    Name = var.tag
  }
  user_data = <<EOF
#!/bin/bash
yum install epel-relase -y
yum install nginx -y
EOF
}

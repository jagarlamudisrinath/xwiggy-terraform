resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = var.subnets

  tags = {
    Name = "My DB subnet group"
  }
}

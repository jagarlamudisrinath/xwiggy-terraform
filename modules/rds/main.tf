
resource "aws_db_instance" "database" {
  identifier = var.rds_name
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = var.rds_name
  username             = var.db_user_name
  password             = var.db_password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = [var.db_security_group]
  db_subnet_group_name = aws_db_subnet_group.default.name

}

//data "aws_db_instance" "database" {
//  db_instance_identifier = var.rds_name
//}

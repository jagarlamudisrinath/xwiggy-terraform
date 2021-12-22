module "rds" {
  source = "../modules/rds"
  db_user_name = "admin"
  db_password = "Password$321"
  db_security_group = module.xwiggy-security-groups.public_security_group_id
  rds_name = "xwiggyrds"
  subnets = [module.xwiggy-vpc.private_subnet_id_1,module.xwiggy-vpc.private_subnet_id_2]
}

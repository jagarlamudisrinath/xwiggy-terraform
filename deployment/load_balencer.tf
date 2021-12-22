module "public-lb" {
  source = "../modules/public-lb"
  bucket_name = "${var.environment}-lb-logs"
  public_lb_name = "${var.environment}-public-lb"
  subnet = [module.xwiggy-vpc.public_subnet_id_1,module.xwiggy-vpc.public_subnet_id_2]
  security_groups = [module.xwiggy-security-groups.public_security_group_id]
  tag = "${var.environment}-public-lb"
}

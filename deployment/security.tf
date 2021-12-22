module "xwiggy-security-groups" {
  source = "../modules/security_group"
  environment = var.environment
  vpc_cidr_block = [var.vpc_cidr_block]
  vpc_id = module.xwiggy-vpc.vpc_id
}
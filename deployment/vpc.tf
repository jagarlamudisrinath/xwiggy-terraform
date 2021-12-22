module "xwiggy-vpc" {
  source = "../modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  environment = var.environment
  private_subnet_cidr_block_1 = var.private_subnet_cidr_block_1
  private_subnet_cidr_block_2 = var.private_subnet_cidr_block_2
  public_subnet_cidr_block_1 = var.public_subnet_cidr_block_1
  public_subnet_cidr_block_2 = var.public_subnet_cidr_block_2
  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2
}

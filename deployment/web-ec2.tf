module "web-1" {
  source = "../modules/web-ec2"
  ami = var.ami_web
  instance_type = var.instance_type_web
  privateip = "10.0.2.222"
  key = module.key-pair.keypair_name
  security_group = module.xwiggy-security-groups.private_security_group_id
  subnet = module.xwiggy-vpc.private_subnet_id_1
  tag = "${var.environment}-web-1"
  availability_zone = var.availability_zone_1
}

module "web-2" {
  source = "../modules/web-ec2"
  ami = var.ami_web
  instance_type = var.instance_type_web
  privateip = "10.0.4.222"
  key = module.key-pair.keypair_name
  security_group = module.xwiggy-security-groups.private_security_group_id
  subnet = module.xwiggy-vpc.private_subnet_id_2
  tag = "${var.environment}-web-2"
  availability_zone = var.availability_zone_1
}

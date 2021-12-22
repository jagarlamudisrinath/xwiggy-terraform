module "App-1" {
  source = "../modules/App-ec2"
  ami = var.ami_App
  availability_zone = var.availability_zone_1
  instance_type = var.instance_type_App
  key = module.key-pair.keypair_name
  privateip = "10.0.2.111"
  security_group = module.xwiggy-security-groups.private_security_group_id
  subnet = module.xwiggy-vpc.private_subnet_id_1
  tag = "${var.environment}-App-1"
}

module "App-2" {
  source = "../modules/App-ec2"
  ami = var.ami_App
  availability_zone = var.availability_zone_2
  instance_type = var.instance_type_App
  key = module.key-pair.keypair_name
  privateip = "10.0.4.111"
  security_group = module.xwiggy-security-groups.private_security_group_id
  subnet = module.xwiggy-vpc.private_subnet_id_2
  tag = "${var.environment}-App-2"
}

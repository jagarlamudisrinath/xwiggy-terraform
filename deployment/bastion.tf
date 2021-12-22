module "basion-host" {
  source = "../modules/App-ec2"
  ami = var.ami_App
  availability_zone = var.availability_zone_1
  instance_type = var.instance_type_App
  key = module.key-pair.keypair_name
  privateip = "10.0.1.10"
  security_group = module.xwiggy-security-groups.public_security_group_id
  subnet = module.xwiggy-vpc.public_subnet_id_1
  tag = "${var.environment}-bastion-host"
}

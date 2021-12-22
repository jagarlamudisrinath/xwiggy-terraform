module "key-pair" {
  source = "../modules/keypair"
  environment = var.environment
  key_pair_pub = file("keys/id_rsa.pub")
}

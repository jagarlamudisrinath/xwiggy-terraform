resource "aws_key_pair" "keypair" {
  key_name   = "${var.environment}-key"
  public_key = var.key_pair_pub
  tags = {
    Name = "${var.environment}-key"
  }
}

output "keypair_name" {
  value = aws_key_pair.keypair.key_name
}

resource "aws_lb" "public" {
  name               = var.public_lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.subnet

  enable_deletion_protection = false

  access_logs {
    bucket  = aws_s3_bucket.lb_access_logs.bucket
    prefix  = "test-lb"
    enabled = true
  }
  tags = {
    Environment = "production-public-lb"
  }
}

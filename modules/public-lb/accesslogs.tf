resource "aws_s3_bucket" "lb_access_logs" {
  bucket = var.bucket_name
  acl    = "public-read-write"

  tags = {
    Name        = "var.bucket_name"
    Environment = "Production"
  }
}

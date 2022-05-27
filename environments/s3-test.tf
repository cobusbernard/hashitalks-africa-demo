resource "random_string" "random" {
  length  = 8
  special = false
  lower   = true
  upper   = false
  # override_special = "/@£$"
}

resource "aws_s3_bucket" "user_data" {
  bucket = "amitkarpeamitkarpeamit-${random_string.random.result}-${terraform.workspace}"
  acl    = "private"
}

output "s3-name" {
  value = aws_s3_bucket.user_data.bucket
}
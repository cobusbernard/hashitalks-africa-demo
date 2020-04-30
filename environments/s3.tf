resource "aws_s3_bucket" "user_data" {
  bucket = "hashitalks-userdata-${terraform.workspace}"
  acl    = "private"
}
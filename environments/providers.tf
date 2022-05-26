provider "aws" {
  version = "3.61.0"
  region  = var.aws_region
  profile = "multi"
  # shared_credentials_file = "/home/ubuntu/.aws/credentials_hashitalks"

  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id}:role/admin"
  }
}
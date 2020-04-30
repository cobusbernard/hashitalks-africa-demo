# Using the module from https://github.com/terraform-aws-modules/terraform-aws-vpc
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "HashiTalks Africa ${terraform.workspace}"
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = false
  enable_vpn_gateway = false
  enable_s3_endpoint = false

  tags = {
    Terraform   = "true"
    Environment = terraform.workspace
  }
}
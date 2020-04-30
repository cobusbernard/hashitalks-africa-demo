# Using the module from https://github.com/terraform-aws-modules/terraform-aws-vpc
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "EMEA Online Summit"
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = false
  enable_s3_endpoint = true

  tags = {
    Terraform   = "true"
    Environment = terraform.workspace
  }
}
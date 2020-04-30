variable "aws_account_id" {
  type = string
}
variable "aws_region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "azs" {
  type = list
}

variable "private_subnets" {
  type = list
}

variable "public_subnets" {
  type = list
}

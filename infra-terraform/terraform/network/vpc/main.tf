locals {
  name   = format("ecommerce-%s-%s-%s", var.appenv, "vpc", "main")
  region = "eu-east-1"

  tags = {
    Name    = local.name
    GithubRepo = "terraform-aws-vpc"
    GithubOrg  = "terraform-aws-modules"
  }
}

################################################################################
# VPC Module
################################################################################

module "vpc" {
  #source = "../../../../building_blocks/terraform-aws-vpc"
  source = "git::http://ashrujit-gitlab.com/terraform-iac/building-blocks/terraform-aws-vpc.git?ref=tags/v1.0"
  #source = "git::http://ashrujit-gitlab.com/terraform-iac/internal_modules/infos.git"

  name = local.name
  cidr = var.cidr_vpc

  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  database_subnets = var.database_subnets

  enable_ipv6 = false

  enable_nat_gateway = false
  single_nat_gateway = false

  /*public_subnet_tags = {
    Name = "overridden-name-public"
  }

  public_subnet_tags_per_az = {
    "${var.region}a" = {
      "availability-zone" = "${var.region}a"
    }
  }*/

  tags = local.tags

  vpc_tags = {
    Name = local.name
  }
}

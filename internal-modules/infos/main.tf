locals {
  naming_level = "ecommerce"
  vpc_name     = format("ecommerce-%s-%s-%s", var.environment, "vpc", "main")

  ecommerce_git_project_id = "8509"

  tfstate_bucket_names = {
    "noprd" = format("tfstate-ashrujitpal-toptal-development")
    "prd" = format("tfstate-ashrujitpal-toptal-production")
  }

   tfstate_bucket_name = local.tfstate_bucket_names[var.AppEnv]

   map_environment_for_mutualized_components = {
    "noprd" = "dev"
    "prd" = "prd"
   } 
   
}

/*data "aws_vpc" "selected_vpc" {
    filter{
        name = "tag:Name"
        values = [local.vpc_name]
    }
}

data "aws_availability_zones" "azs" {
  state = "available"

  filter {
    name = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

data "aws_subnets" "public_subnet_ids" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.selected_vpc.id]
  }

  filter {
    name = "tag:Name"
    values = formatlist("%s-public-%s%s", local.vpc_name, var.region, ["a","b","c"])
  }

  filter {
    name = "tag:NetworkTier"
    values = ["public"]
  }
}

data "aws_subnet" "public_subnets" {
  count = length(data.aws_subnets.public_subnet_ids.ids)
  id = tolist(data.aws_subnets.public_subnet_ids.ids)[count.index]
}

data "aws_route_tables" "public_rts_ids" {
  vpc_id = data.aws_vpc.selected_vpc.id

  filter {
    name = "tag:Name"
    values = [format("%s-public", local.vpc_name)]
  }
}

data "aws_subnets" "private_subnet_ids" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.selected_vpc.id]
  }

  filter {
    name = "tag:Name"
    values = formatlist("%s-private-%s%s", local.vpc_name, var.region, ["a","b","c"])
  }

  filter {
    name = "tag:NetworkTier"
    values = ["private"]
  }
}

data "aws_subnet" "private_subnets" {
  count = length(data.aws_subnets.private_subnet_ids.ids)
  id = tolist(data.aws_subnets.private_subnet_ids.ids)[count.index]
}

data "aws_subnets" "database_subnet_ids" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.selected_vpc.id]
  }

  filter {
    name = "tag:Name"
    values = formatlist("%s-db-%s%s", local.vpc_name, var.region, ["a","b","c"])
  }

  filter {
    name = "tag:NetworkTier"
    values = ["db"]
  }
}

data "aws_subnet" "database_subnets" {
  count = length(data.aws_subnets.database_subnet_ids.ids)
  id = tolist(data.aws_subnets.database_subnet_ids.ids)[count.index]
}

data "aws_network_acls" "public_nacls" {
  filter{
    name = "association.subnet-id"
    values = data.aws_subnets.public_subnet_ids.ids
  }
}

data "aws_nat_gateway" "backend_ngw" {
  vpc_id = data.aws_vpc.selected_vpc.id

  filter {
    name = "tag:Name"
    values = formatlist("%s-%s-nat-instance-%s", local.naming_level, var.AppEnv, ["0", "1", "2"])
  }

}

data "aws_nat_gateway" "backend_ngw_ips" {
  count  = length(data.aws_nat_gateway.backend_ngw.id)
  vpc_id = data.aws_vpc.selected_vpc.id
  id     = tolist(data.aws_nat_gateway.backend_ngw.id)[count.index]
}

data "aws_security_groups" "thisgroups" {
  for_each = toset(var.security_groups)

  filter {
    name = "group_name"
    values = [each.value]
  }

  filter {
    name = "vpc-id"
    values = [data.aws_vpc.selected_vpc.id]
  }
}

data "aws_kms_key" "kms_keys" {
  for_each = toset(var.security_groups)

  key_id = each.value
}

data "terraform_remote_state" "private_alb" {
  count = contains(var.resources, "private_alb") ? 1 : 0
  backend = "s3"

  config = {
    bucket = local.tfstate_bucket_name
    key = format("tf%s%s/workloads-private-alb.tfstate", local.ecommerce_git_project_id,local.map_environment_for_mutualized_components[var.AppEnv])
    region = var.region
   }

}*/
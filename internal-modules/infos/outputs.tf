/*output "vpc_id" {
  value = data.aws_vpc.selected_vpc.id
}

output "vpc_cidr" {
    value = data.aws_vpc.selected_vpc.cidr_block  
}

output "vpc_name" {
  value = local.vpc_name
}

output "availability_zone" {
  value = data.aws_availability_zones.azs.names
}

output "public_subnet_ids" {
  value = tolist(values(zipmap(data.aws_subnet.public_subnets.*.availability_zone, data.aws_subnet.public_subnets.*.id)))
}

output "public_subnet_cidr" {
  value = tolist(values(zipmap(data.aws_subnet.public_subnets.*.availability_zone, data.aws_subnet.public_subnets.*.cidr_block)))
}

output "public_subnet_cidrs_by_azs_names" {
  value = { for subnets in toset(data.aws_subnet.public_subnets) :
        subnets.availability_zone => subnets.cidr_block
  }
}

output "public_subnet_a_id" {
  value = values(zipmap(data.aws_subnet.public_subnets.*.availability_zone, data.aws_subnet.public_subnets.*.id))[0]
}

output "public_subnet_b_id" {
  value = values(zipmap(data.aws_subnet.public_subnets.*.availability_zone, data.aws_subnet.public_subnets.*.id))[1]
}

output "public_subnet_c_id" {
  value = values(zipmap(data.aws_subnet.public_subnets.*.availability_zone, data.aws_subnet.public_subnets.*.id))[2]
}

output "public_route_tables_ids" {
  value = tolist(data.aws_route_tables.public_rts_ids.ids)
}
output "tfstate_bucket_name" {
  value = local.tfstate_bucket_name
}*/

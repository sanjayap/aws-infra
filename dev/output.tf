output "vpc_id" {
  value = module.dev_vpc.vpc_id
}

output "vpc_cidr" {
  value = module.dev_vpc.vpc_cidr
}

output "public_subnet_ids" {
  value = module.dev_vpc.public_subnet_ids
}

output "private_app_subnet_ids" {
  value = module.dev_vpc.private_app_subnet_ids
}

output "private_db_subnet_ids" {
  value = module.dev_vpc.private_db_subnet_ids
}

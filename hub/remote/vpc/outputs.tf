output "remote_vpc_id" {
  value = module.vpc.vpc_id
}

output "remote_secure_route_table_id" {
  value = aws_route_table.remote.id
}

output "remote_cidr_block" {
  value = module.vpc.vpc_cidr_block
}
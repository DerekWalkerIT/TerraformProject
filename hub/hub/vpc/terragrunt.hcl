terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws//.?version=3.5.0"
}

include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl"))
}

inputs = {
  name = "wwl-hub"
  default_vpc_name = "wwl-hub-default"

  # vpc
  create_vpc = true
  manage_default_route_table = true
  propagate_private_route_tables_vgw = false # false by default

  cidr                  = "10.1.0.0/16"
  private_subnets        = ["10.1.0.0/19"]
  private_subnet_tags = {
    "Name": "wwl-hub-private-app-1",
  }
  public_subnets       = ["10.1.192.0/19"]
  public_subnet_tags = {
    "Name": "wwl-hub-public-web-1",
  }
  aws_region            = local.env_vars.locals.aws_region
  azs                   = local.env_vars.locals.azs

  # dns
  enable_dns_hostnames    = true
  enable_dns_support      = true

  # nat
  enable_nat_gateway      = true
  single_nat_gateway      = true
  one_nat_gateway_per_az  = false
  reuse_nat_ips           = false 
  nat_gateway_tags = {
    "Name": "wwl-hub-nat-gateway"
  }
}
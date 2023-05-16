terraform {
  source = "tfr:///terraform-aws-modules/security-group/aws//.?version=4.17.0"
}

include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("terragrunt.hcl"))
}

dependencies {
  paths = ["../../vpc"]
}

dependency "vpc" {
  config_path = "../../vpc"
}

inputs = {
  ingress_cidr_blocks = [local.env_vars.locals.remote_cidr, local.env_vars.locals.hub_cidr, local.env_vars.locals.onprem_cidr]

  ingress_rules = ["all-tcp", "all-icmp"]

  name = "allow-traffic-to-prod"

  description = "Allow Traffic to Prod"

  vpc_id = dependency.vpc.outputs.vpc_id

  egress_with_cidr_blocks = [
    {
      rule        = "all-all"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}
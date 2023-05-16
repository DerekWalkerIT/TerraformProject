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
  paths = ["../../vpc", "../app_server_private"]
}

dependency "vpc" {
  config_path = "../../vpc"
}

dependency "app_server_private" {
  config_path = "../app_server_private"
}

inputs = {
  name = "database-server"

  ingress_cidr_blocks = [local.env_vars.locals.onprem_cidr]

  ingress_rules = ["mssql-tcp"]

  ingress_with_source_security_group_id = [
    {
      rule                     = "mssql-tcp"
      source_security_group_id = "${dependency.app_server_private.outputs.security_group_id}"
    }
  ]

  description = "Allow MSSQL"

  vpc_id = dependency.vpc.outputs.vpc_id

  egress_with_cidr_blocks = [
    {
      rule        = "all-all"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}
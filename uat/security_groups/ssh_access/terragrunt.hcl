terraform {
  source = "tfr:///terraform-aws-modules/security-group/aws//.?version=4.17.0"
}

include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

dependencies {
  paths = ["../../vpc"]
}

dependency "vpc" {
  config_path = "../../vpc"
}

inputs = {
  ingress_cidr_blocks = ["192.168.0.0/16"]

  ingress_rules = ["ssh-tcp"]

  name = "ssh-access"

  description = "Allow SSH connections"

  vpc_id = dependency.vpc.outputs.vpc_id

  egress_with_cidr_blocks = [
    {
      rule        = "all-all"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}
locals {
  account_id      = "${get_aws_account_id()}"
  
  aws_region      = "us-east-1"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]

  onprem_cidr     = "192.168.0.0/16"

  hub_cidr        = "10.1.0.0/16"

  remote_cidr     = "10.10.0.0/16"

  dev_cidr        = "10.2.0.0/16"

  uat_cidr        = "10.3.0.0/16"

  prod_cidr       = "10.4.0.0/16"
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "${local.aws_region}"
}
EOF
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "terragrunt-${get_aws_account_id()}-statefiles"
    key            = "core-infrastructure/${path_relative_to_include()}//terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terragrunt-${get_aws_account_id()}-lockfiles"
  }
}
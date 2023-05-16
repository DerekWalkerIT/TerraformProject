provider "aws" {
  region = "us-east-2"
}

terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket         = "terragrunt-311178072844-statefiles"
    dynamodb_table = "terragrunt-311178072844-lockfiles"
    encrypt        = true
    key            = "core-infrastructure/core-infrastructure/terraform.tfstate"
    region         = "us-east-1"
  }
}

data "aws_ssoadmin_instances" "sso" {}

module "groups" {
  source            = "./sso/groups"
  instance_arn      = tolist(data.aws_ssoadmin_instances.sso.arns)[0]
  identity_store_id = tolist(data.aws_ssoadmin_instances.sso.identity_store_ids)[0]

  administrator_access_arn = module.permission_sets.administrator_access_arn
  view_only_arn            = module.permission_sets.view_only_arn
}

module "permission_sets" {
  source       = "./sso/permission_sets"
  instance_arn = tolist(data.aws_ssoadmin_instances.sso.arns)[0]
}

module "users" {
  source              = "./sso/users"
  identity_store_id   = tolist(data.aws_ssoadmin_instances.sso.identity_store_ids)[0]
  admins_group_id     = module.groups.admins_group_id
  developers_group_id = module.groups.developers_group_id
}

module "budgets" {
  source = "./sso/budgets"
}
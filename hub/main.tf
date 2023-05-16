terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket  = "terragrunt-946167209662-statefiles"
    encrypt = true
    key     = "core-infrastructure/hub/terraform.tfstate"
    region  = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "remote_vpc" {
  source             = "./remote/vpc"
  transit_gateway_id = var.transit_gateway_id
}

module "remote_vpc_atachments" {
  source                       = "./remote/vpc_attachments"
  remote_vpc_id                = module.remote_vpc.remote_vpc_id
  remote_secure_route_table_id = var.remote_secure_route_table_id
}

module "remote_vpn" {
  source             = "./remote/vpn" # client vpn module (remote end-users)
  # remote_vpc_id      = module.remote_vpc.remote_vpc_id
  # remote_1_subnet_id = module.remote_vpc_atachments.remote_1_subnet_id
}

module "hub_vpc_attachments" {
  source                     = "./hub/vpc_attachments"
  hub_vpc_id                 = var.hub_vpc_id
  hub_public_route_table_id  = var.hub_public_route_table_id
  hub_private_route_table_id = var.hub_private_route_table_id
  on_prem_cidr_block         = var.on_prem_cidr_block
  transit_gateway_id         = var.transit_gateway_id
  dev_cidr_block             = var.dev_cidr_block
  prod_cidr_block            = var.prod_cidr_block
  uat_cidr_block             = var.uat_cidr_block
  remote_cidr_block          = var.remote_cidr_block
}

module "hub_vpn" {
  source     = "./hub/vpn" # site-to-site vpn module (wwl-hub to on-prem)
  hub_vpc_id = var.hub_vpc_id
}

module "hub_transit_gateway" {
  source                       = "./hub/transit_gateway"
  hub_vpc_id                   = var.hub_vpc_id
  hub_private_app_1_subnet_id  = var.hub_private_app_1_subnet_id
  hub_private_app_2_subnet_id  = var.hub_private_app_2_subnet_id
  hub_private_backup_subnet_id = var.hub_private_app_backup
}

module "remote_transit_gateway" {
  source             = "./remote/transit_gateway"
  remote_1_subnet_id = var.remote_1_subnet_id
  remote_2_subnet_id = var.remote_2_subnet_id
  remote_vpc_id      = var.remote_vpc_id
  transit_gateway_id = var.transit_gateway_id
}
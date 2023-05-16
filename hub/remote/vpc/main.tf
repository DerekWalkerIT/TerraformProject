provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source  = "cloudposse/vpc/aws"
  version = "2.0.0"

  name                             = "wwl-remote"
  ipv4_primary_cidr_block          = "10.10.0.0/16"
  assign_generated_ipv6_cidr_block = false

  # default_security_group_deny_all = var.default_security_group_deny_all
  # default_route_table_no_routes   = var.default_route_table_no_routes
  # default_network_acl_deny_all    = var.default_network_acl_deny_all

  internet_gateway_enabled = true

  context = module.this.context
}
resource "aws_route_table" "remote" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.vpc.igw_id
  }

  route {
    cidr_block         = "10.1.0.0/16"
    transit_gateway_id = var.transit_gateway_id
  }

  route {
    cidr_block         = "10.2.0.0/16"
    transit_gateway_id = var.transit_gateway_id
  }

  route {
    cidr_block         = "10.3.0.0/16"
    transit_gateway_id = var.transit_gateway_id
  }

  route {
    cidr_block         = "10.4.0.0/16"
    transit_gateway_id = var.transit_gateway_id
  }

  route {
    cidr_block         = "192.168.0.0/16"
    transit_gateway_id = var.transit_gateway_id
  }

  tags = {
    Name = "wwl-remote-secure"
  }
}
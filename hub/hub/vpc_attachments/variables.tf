variable "hub_vpc_id" {
  type = string
}

variable "hub_public_route_table_id" {
  type = string
}

variable "hub_private_route_table_id" {
  type = string
}

variable "on_prem_cidr_block" {
  type = string
}

variable "dev_cidr_block" {
  type = string
}

variable "prod_cidr_block" {
  type = string
}

variable "uat_cidr_block" {
  type = string
}

variable "transit_gateway_id" {
  type = string
}

variable "remote_cidr_block" {
  type = string
}
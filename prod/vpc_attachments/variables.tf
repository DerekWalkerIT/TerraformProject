variable "prod_vpc_id" {
  type    = string
  default = "vpc-0a28da47ff8bc42d2"
}

variable "prod_public_route_table_id" {
  type    = string
  default = "rtb-0f28bde1f50dd2482"
}

variable "prod_private_route_table_id" {
  type    = string
  default = "rtb-0f8f4a95d03a1920a"
}

variable "on_prem_cidr_block" {
  type    = string
  default = "192.168.0.0/16"
}

variable "hub_cidr_block" {
  type    = string
  default = "10.1.0.0/16"
}

variable "transit_gateway_id" {
  type    = string
  default = "tgw-0bf7fad5c6805c53d"
}

variable "remote_cidr_block" {
  type    = string
  default = "10.10.0.0/16"
}
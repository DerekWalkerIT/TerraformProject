variable "dev_vpc_id" {
  type    = string
  default = "vpc-0dc4e2797b495b112"
}

variable "dev_private_route_table_id" {
  type    = string
  default = "rtb-049064643ef2d57ff"
}

variable "dev_public_route_table_id" {
  type    = string
  default = "rtb-0f9b62147880e9dca"
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

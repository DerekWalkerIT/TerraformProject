variable "uat_vpc_id" {
  type    = string
  default = "vpc-02fd0a80b39e453ef"
}

variable "uat_public_route_table_id" {
  type    = string
  default = "rtb-00925d319fdefa228"
}

variable "uat_private_route_table_id" {
  type    = string
  default = "rtb-070b219ed29befc99"
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

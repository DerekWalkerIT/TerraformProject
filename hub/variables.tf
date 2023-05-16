
variable "hub_account_id" {
  type    = string
  default = "946167209662"
}

variable "hub_vpc_id" {
  type    = string
  default = "vpc-0e01b4b9553d9186e"
}

variable "remote_vpc_id" {
  type    = string
  default = "vpc-0ff5d99983c1f9ee6"
}

variable "on_prem_cidr_block" {
  type    = string
  default = "192.168.0.0/16"
}

variable "hub_cidr_block" {
  type    = string
  default = "10.1.0.0/16"
}


variable "dev_cidr_block" {
  type    = string
  default = "10.2.0.0/16"
}

variable "uat_cidr_block" {
  type    = string
  default = "10.3.0.0/16"
}

variable "prod_cidr_block" {
  type    = string
  default = "10.4.0.0/16"
}

variable "remote_cidr_block" {
  type    = string
  default = "10.10.0.0/16"
}

variable "transit_gateway_id" {
  type    = string
  default = "tgw-0bf7fad5c6805c53d"
}

variable "hub_private_route_table_id" {
  type    = string
  default = "rtb-0e83e70d46ad61061"
}

variable "hub_public_route_table_id" {
  type    = string
  default = "rtb-0cb9d9ff2def6d579"
}

variable "remote_1_subnet_id" {
  type    = string
  default = "subnet-00d3d42a8f18af679"
}

variable "remote_2_subnet_id" {
  type    = string
  default = "subnet-07c8c7a5fc5b4f6fa"
}

variable "remote_secure_route_table_id" {
  type    = string
  default = "rtb-0e28380b25720069d"
}

variable "hub_private_app_1_subnet_id" {
  type    = string
  default = "subnet-0ae8472d35d835a28"
}

variable "hub_private_app_2_subnet_id" {
  type    = string
  default = "subnet-0b250cf0cab86540d"
}

variable "hub_private_app_backup" {
  type    = string
  default = "subnet-0c254d8b23f106262"
}
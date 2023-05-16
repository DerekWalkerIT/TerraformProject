provider "aws" {
  region = "us-east-1"
}

resource "aws_customer_gateway" "wwl_customer_gateway" {
  bgp_asn    = 65000
  ip_address = "173.244.138.98"
  type       = "ipsec.1"

  tags = {
    Name = "wwl-customer-gateway"
  }
}

resource "aws_vpn_connection" "wwl_site_to_site_vpn" {
  customer_gateway_id      = aws_customer_gateway.wwl_customer_gateway.id
  outside_ip_address_type  = "PublicIpv4"
  transit_gateway_id       = "tgw-0bf7fad5c6805c53d"
  type                     = "ipsec.1"
  static_routes_only       = true
  local_ipv4_network_cidr  = "192.168.0.0/16"
  remote_ipv4_network_cidr = "10.0.0.0/8"

  tags = {
    Name = "wwl-site-to-site-vpn"
  }
}
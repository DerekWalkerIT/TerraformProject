variable "hub_vpc_id" {
  type        = string
  description = "The ID of the VPC to which the Virtual Private Gateway will be attached"
}

variable "vpn_gateway_amazon_side_asn" {
  description = "The Autonomous System Number (ASN) for the Amazon side of the VPN gateway. If you don't specify an ASN, the Virtual Private Gateway is created with the default ASN"
  default     = 64512
}

variable "customer_gateway_bgp_asn" {
  description = "The gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN)"
  default     = 65000
}

variable "customer_gateway_ip_address" {
  type        = string
  default     = "173.244.138.98"
  description = "The IP address of the gateway's Internet-routable external interface"
}

variable "vpn_connection_static_routes_only" {
  type        = bool
  description = "If set to `true`, the VPN connection will use static routes exclusively. Static routes must be used for devices that don't support BGP"
  default     = true
}

variable "vpn_connection_static_routes_destinations" {
  type        = list(string)
  default     = ["192.168.0.0/16"]
  description = "List of CIDR blocks to be used as destination for static routes. Routes to destinations will be propagated to the route tables defined in `route_table_ids`"
}

variable "vpn_connection_local_ipv4_network_cidr" {
  type        = string
  description = "The IPv4 CIDR on the customer gateway (on-premises) side of the VPN connection."
  default     = "192.168.0.0/16" # TODO -  may need to change
}

variable "hub_route_table_ids" {
  type        = list(string)
  default     = []
  description = "The IDs of the route tables for which routes from the Virtual Private Gateway will be propagated"
}
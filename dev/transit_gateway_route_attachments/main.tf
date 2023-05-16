# route attachment: wwl-dev-private route table to on_prem network
resource "aws_route" "dev_to_on_prem" {
  route_table_id         = "rtb-049064643ef2d57ff"
  destination_cidr_block = "192.168.0.0/16"
  transit_gateway_id     = var.transit_gw_id
}

resource "aws_route" "dev_to_hub" {
  route_table_id         = "rtb-049064643ef2d57ff"
  destination_cidr_block = "10.1.0.0/16"
  transit_gateway_id     = var.transit_gw_id
}

resource "aws_route" "dev_to_remote" {
  route_table_id         = "rtb-049064643ef2d57ff"
  destination_cidr_block = "10.10.0.0/16"
  transit_gateway_id     = var.transit_gw_id
}
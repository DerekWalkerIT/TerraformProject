resource "aws_route" "prod_to_on_prem" {
  route_table_id         = "rtb-0f8f4a95d03a1920a"
  destination_cidr_block = "192.168.0.0/16"
  transit_gateway_id     = var.transit_gw_id
}

resource "aws_route" "prod_to_hub" {
  route_table_id         = "rtb-0f8f4a95d03a1920a"
  destination_cidr_block = "10.1.0.0/16"
  transit_gateway_id     = var.transit_gw_id
}

resource "aws_route" "prod_to_remote" {
  route_table_id         = "rtb-0f8f4a95d03a1920a"
  destination_cidr_block = "10.10.0.0/16"
  transit_gateway_id     = var.transit_gw_id
}